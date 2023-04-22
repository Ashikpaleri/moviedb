import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/base_module/presentation/core/values/app_constants.dart';
import 'package:machine_test/base_module/presentation/core/values/style.dart';
import 'package:machine_test/home/home_module/data/model/home_results_model.dart';
import 'package:machine_test/home/home_module/presentation/feature/bloc/home_bloc/home_data_bloc.dart';
import 'package:machine_test/home/home_module/presentation/feature/component/home_list_tile.dart';
import 'package:machine_test/home/home_module/presentation/feature/component/search_field.dart';
import 'package:machine_test/home/home_module/presentation/feature/screen/movie_detaile_screen.dart';

import '../component/custom_subpar_for_movie_tile.dart';
import 'dart:io' show Platform;
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAndroid = true;
  @override
  void initState() {
    super.initState();
    getPlatform();
    getHomeData();
  }

getPlatform(){
  if (Platform.isAndroid) {
    setState(() {
      isAndroid = true;
    });
    print('This is an Android device.');
  } else if (Platform.isIOS) {
    setState(() {
      isAndroid = false;
    });
  } else {

    print('This is neither an Android nor iOS device.');
  }
}



  TextEditingController _searchController = TextEditingController();

  List<HomeResultsModel>? _searchList = [];

  getHomeData() async {
    BlocProvider.of<HomeDataBloc>(context).add(GetHomeData(querydata: _searchController.text.isEmpty ?'a':_searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),

          floatingActionButton: FloatingActionButton(
            backgroundColor: CommonColors.colorOrange,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
            
            },
            child:  Icon(Icons.favorite_border),
          ),
          body: RefreshIndicator(
            onRefresh: (){
              getHomeData();

              return Future.delayed(Duration(seconds: 0));
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BlocBuilder<HomeDataBloc, HomeDataState>(
                    builder: (context, state) {
                  var size = MediaQuery.of(context).size;
                  if (state is HomeDataInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeDataLode) {
                    _searchList = state.movieDetails!.results;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: AppConstants.defaultPadding,
                          ),
                          // SearchBaForWaiter(),
                          isAndroid == true?
                          TextField(

                            controller: _searchController,

                            decoration:  InputDecoration(

                                hintText: 'Search',
                                border: InputBorder.none,

                                fillColor: CommonColors.colorWhite,

                                suffix:
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        _searchController.clear();
                                      });
                                      getHomeData();
                                    },
                                    child: Icon(Icons.clear)),
                                // isDense: true,
                                filled: true),
                            onChanged: (value) {
                              getHomeData();
                              setState(() {
                                _searchList = state.movieDetails!.results!
                                    .where((item) => item.title!
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                          ):CupertinoSearchTextField(
                            controller: _searchController,
                            placeholder: 'Search',
                            onSubmitted: (value) {
                              // Perform search
                            },

                             onChanged: (value) {
                    getHomeData();
                    setState(() {
                    _searchList = state.movieDetails!.results!
                        .where((item) => item.title!
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                        .toList();
                    });
                    },
                          ),

                          const SizedBox(
                            height: AppConstants.defaultPadding,
                          ),



                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: _searchList?.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                // var movieDetails = _searchList?[index];
                                return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieDetails: _searchList?[index]),));
                                    },
                                    child: HomeListTile(movieDetails: _searchList?[index] ,index: index,));
                              })
                        ],
                      ),
                    );
                  } else if (state is HomeDataFail) {
                    _searchController.clear();
                    return Center(
                      child: Column(
                        children: const [
                          SizedBox(height: AppConstants.defaultPadding *2,),
                          Text("please refreh"),
                          SizedBox(height: AppConstants.defaultPadding/2,),
                          Text("No item Mach"),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        width: 150,
                        height: 180,
                        child: Text("Some Error"),
                      ),
                    );
                  }
                }),
              ),
            ),
          )),
    );
  }
}
