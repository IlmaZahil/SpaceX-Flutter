// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart';
// import 'package:space_x/screens/details.dart';

import 'package:space_x/models/api_model.dart';
import 'package:dio/dio.dart';

class DetailsApiServices {
  String _url = "https://api.spacexdata.com/v2/launches";
  late Dio _dio;

  DetailsApiServices() {
    _dio = Dio();
  }

  Future<List<Spacex>> fetchDetails() async {
    try {
      var response = await _dio.get(_url);
      Links links = Links.fromJson(response.data);
      return links.spacex;
    } on DioError catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }
}



// List<Map> details = [
//   {
//     'title': 'CRS20',
//     'subtitle': '1234567899900vh',
//     'image': 'assets/images/img2.png',
//     'mainimg': 'assets/images/space.png',
//   },
//   {
//     'title': 'CRS20',
//     'subtitle': 'hksxLGALIuchvkxut',
//     'image': 'assets/images/img1.png',
//     'mainimg': 'assets/images/space.png',
//   },
//   {
//     'title': 'CRS20',
//     'subtitle': 'steukjfkut,jk,kkutyjxj',
//     'image': 'assets/images/img2.png',
//     'mainimg': 'assets/images/space.png',
//   },
// ];

// void getdetails() async {
//   var response = await Dio().get('https://api.spacexdata.com/v2/launches');
//   print(response.data.length);
// }



///                     ***********************

// Future<List<Link>> getLinks() async {
//   var response = await Dio().get(endPointUrl);
//   print(response.data.length);

//   if (response.statusCode == 200) {
//     Map<String, dynamic> json = jsonDecode(response.data);

//     List<dynamic> data = json['links'];

//     List<Links> links =
//         data.map((dynamic item) => Links.fromJson(item)).toList();

//     return links;
//   } else {
//     throw ("Can't get the Details");
//   }
// }
