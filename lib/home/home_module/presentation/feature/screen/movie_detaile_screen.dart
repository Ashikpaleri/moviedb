

import 'package:flutter/material.dart';
import 'package:machine_test/base_module/presentation/core/values/app_assets.dart';
import 'package:machine_test/base_module/presentation/core/values/app_constants.dart';
import 'package:machine_test/home/home_module/data/model/home_results_model.dart';

import '../component/custom_content_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final HomeResultsModel? movieDetails;
  const MovieDetailsScreen({Key? key, this.movieDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding,vertical: AppConstants.defaultPadding* 2),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 200,
                    decoration:  BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(image: AssetImage(ThemeAssets.movie),fit: BoxFit.cover),
                      ),

                  ),

               Container(
                 width: size.width,
                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                   color: Colors.white,
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     CustomContentWidget(name: "Name : ",content:movieDetails!.title! ),



                     SizedBox(height: AppConstants.defaultPadding/2,),

                     CustomContentWidget(name: "Adults Only : ",content:  movieDetails!.adult! == false?"No":"yes" ),


                     SizedBox(height: AppConstants.defaultPadding/2,),
                     CustomContentWidget(name: "Popularity : ",content:movieDetails!.popularity.toString() ),
                     SizedBox(height: AppConstants.defaultPadding/2,),
                     SizedBox(height: AppConstants.defaultPadding/2,),




                     Text("OverView"),
                     Text(movieDetails!.overview!,overflow: TextOverflow.ellipsis,maxLines: 10,)



                   ],
                 ),
                 
               ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
