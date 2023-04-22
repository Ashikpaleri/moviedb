import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:machine_test/base_module/presentation/core/values/app_constants.dart';
import 'package:machine_test/base_module/presentation/core/values/style.dart';
import 'package:machine_test/home/home_module/data/model/home_results_model.dart';

import 'custom_subpar_for_movie_tile.dart';

class HomeListTile extends StatefulWidget {
  final HomeResultsModel? movieDetails;
  final int? index;

  const HomeListTile({Key? key, this.movieDetails, this.index})
      : super(key: key);

  @override
  State<HomeListTile> createState() => _HomeListTileState();
}

class _HomeListTileState extends State<HomeListTile> {
  bool isSelected = false;
  final _fav_data_box = Hive.box("fav_data_box");
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    _refreshItem();
    super.initState();
  }

  Future<void> createItem(Map<String, dynamic> newItem) async {
    final box = await Hive.box('fav_data_box');
    if (box.containsKey(widget.movieDetails!.id)) {

      box.delete(widget.movieDetails!.id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: CommonColors.colorOrange,
          elevation: 4,
          // backgroundColor: Colors.white,
          content: Text('Movie Removed',),
        ),
      );
      // showToast("Bookmark Removed");
    } else {

      var data = {
        "key": widget.movieDetails!.id,
        "name": widget.movieDetails!.title,
        "adult": widget.movieDetails!.adult,
        "id": widget.movieDetails!.id,
        "overView": widget.movieDetails!.overview,
        "popularity": widget.movieDetails!.popularity,
      };
      box.put(widget.movieDetails!.id, data);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: CommonColors.colorOrange,
          elevation: 4,
          // backgroundColor: Colors.white,
          content: Text('Movie Added',),
        ),
      );

    }
    // await _fav_data_box.add(newItem);
    print("amount data${_fav_data_box.length}");
    _refreshItem();
  }

  bool isExist = false;

  void _refreshItem() {
    final data = _fav_data_box.keys.map((key) {
      final item = _fav_data_box.get(key);

      print(item);
      // print(item.);
      return {
        "key": key,
        "name": item["name"],
        "adult": item['adult'],
        "id": item["id"],
        "overView": item["overView"],
        "popularity": item["popularity"],
      };
    }).toList();
    setState(() {
      _items = data.toList();
    });
  }

  Future<void> delete(int newItem) async {
    await _fav_data_box.delete(newItem);
    print("amount data${_fav_data_box.length}");
    _refreshItem();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
        valueListenable: Hive.box("fav_data_box").listenable(),
        builder: (context, box, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              // height: 50,
              width: size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSubpartForGridTile(
                      heading: "Name",
                      content: widget.movieDetails?.title,
                    ),

                    const SizedBox(
                      height: AppConstants.defaultPadding / 2,
                    ),
                    CustomSubpartForGridTile(
                      heading: "Popularity",
                      content: "${widget.movieDetails?.popularity}",
                    ),
                    const SizedBox(
                      height: AppConstants.defaultPadding / 2,
                    ),
                    CustomSubpartForGridTile(
                      heading: "AdultsOnly",
                      content:
                          widget.movieDetails?.adult == false ? "No" : "Yes",
                    ),
                    const SizedBox(
                      height: AppConstants.defaultPadding / 2,
                    ),
                    // CustomSubpartForGridTile(heading: "OverView",content:"${movieDetails?.overview}",),
                    const Text(
                      "OverView",
                      style: Style.subheadingTwoUnderline,
                    ),
                    const SizedBox(
                      height: AppConstants.defaultPadding / 2,
                    ),

                    Text("${widget.movieDetails?.overview}",
                        style: Style.subheadingThree,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(
                      height: AppConstants.defaultPadding,
                    ),

                    SizedBox(
                      width: size.width,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                          createItem({
                            "name": widget.movieDetails?.title,
                            "adult": widget.movieDetails?.adult,
                            "id": widget.movieDetails?.id,
                            "overView": widget.movieDetails?.overview,
                            "popularity": widget.movieDetails?.popularity
                          });
                        },
                        child: box.containsKey(widget.movieDetails!.id)
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                        // child: Center(
                        //   child: isSelected == false
                        //       ? const Icon(Icons.favorite_border)
                        //       : const Icon(Icons.favorite, color: Colors.red),
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: AppConstants.defaultPadding / 4,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
