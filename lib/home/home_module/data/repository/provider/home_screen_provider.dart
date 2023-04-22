import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/home/home_module/data/model/home_model.dart';

class HomeProvider{
  String apikey = "94aa489f5a63a8dd3819f4892b4b2223";

  Future<HomeModel?> getPosts({String ? searchData,

  })async{


    var    body ={
      "query": searchData,
      // "apiKey": apikey,

    };




    var client =http.Client();
    var uri = Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=${apikey}&query=${searchData}");

    var response = await client.get(uri);
    if(response.statusCode == 200||response.statusCode == 201){
      var jsonString = response.body;
      var decode = jsonDecode(jsonString);


      return HomeModel.fromJson(decode);
    }

  }
}





// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:machine_test/home/home_module/data/model/home_model.dart';
//
// class HomeProvider{
//
//   Future<HomeModel?> getPosts()async{
//     var client =http.Client();
//     var uri = Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=94aa489f5a63a8dd3819f4892b4b2223&query=a");
//
//     var response = await client.get(uri);
//     if(response.statusCode == 200||response.statusCode == 201){
//       var jsonString = response.body;
//       var decode = jsonDecode(jsonString);
//
//
//       return HomeModel.fromJson(decode);
//     }
//
//   }
// }