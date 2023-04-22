
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:machine_test/base_module/presentation/core/values/app_constants.dart';
import 'package:machine_test/base_module/presentation/core/values/style.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final _fav_data_box = Hive.box("fav_data_box");
  List<Map<String, dynamic>> _items =[];

  void _refreshItem(){
    final data = _fav_data_box.keys.map((key)  {
      final item = _fav_data_box.get(key);
      return {"key":key,"name":item["name"], "adult":item['adult'],"id":item["id"],"overView":item["overView"],"popularity":item["popularity"]

      };
    }).toList();
    setState((){
      _items = data.reversed.toList();

    });


  }


  @override
  void initState() {
    _refreshItem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),


        body: SingleChildScrollView(
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
            child: Column(

              children: [
                const SizedBox(height: AppConstants.defaultPadding,),
               SizedBox(
                 width: size.width,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text("Favorites",style: Style.subheading),
                     InkWell(
                         onTap: (){
                           setState(() {
                              _fav_data_box.clear();

                           });
                           print(_fav_data_box.values);
                         },
                         child
                         : const Text("Clear",style: Style.clear))
                   ],
                 ),
               ),
                const SizedBox(height: AppConstants.defaultPadding*1.5,),

                ValueListenableBuilder(valueListenable: Hive.box("fav_data_box").listenable(), builder: (context, box,child){
                  return
                    box.values.isEmpty?
                    Container(
                      height: 300,
                      width: 250,
                      child: const Center(child: Text("No data",style: Style.subheading,)),
                    ):
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _items.length,
                      itemBuilder: (context, index){
                        final currentItem = _items[index];
                        return Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Movie : ${currentItem['name']}",style: Style.subheadingTwo),
                              const SizedBox(height: AppConstants.defaultPadding/2,),
                              Text("Adults Only : ${currentItem['adult'].toString()}",style: Style.subheadingThree),
                              const SizedBox(height: AppConstants.defaultPadding/2,),

                              Text("Popularity : ${currentItem['popularity']}",style: Style.subheadingThree),
                              const SizedBox(height: AppConstants.defaultPadding/2,),

                              Text("Over View : ${currentItem['overView']}",style: Style.subheadingThree,maxLines: 3,overflow: TextOverflow.ellipsis),
                              const SizedBox(height: AppConstants.defaultPadding/2,),


                            ],
                          ),
                        ),);
                        // Text(currentItem['name']
                        // );
                      });
                }),


                const SizedBox(height: AppConstants.defaultPadding ,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
