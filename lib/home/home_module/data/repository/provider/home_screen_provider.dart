import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/home/home_module/data/model/home_model.dart';

class HomeProvider{

  Future<HomeModel?> getPosts({String ? searchData,
    // String ? apiKey
  })async{


    var    body ={
      "query": searchData,
      // "apiKey": apiKey,

    };




    var client =http.Client();
    var uri = Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=94aa489f5a63a8dd3819f4892b4b2223&query=${searchData}");

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