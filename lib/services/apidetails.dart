// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'dart:io';
// // import 'package:http/http.dart';
// // import 'package:space_x/screens/details.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

import 'package:space_x/models/api_model.dart';

// import 'package:space_x/models/api_model.dart';
// import 'package:dio/dio.dart';

// class DetailsApiServices {
//   String _url = "https://api.spacexdata.com/v2/launches";
//   late Dio _dio;

//   DetailsApiServices() {
//     _dio = Dio();
//   }

// // List<Map> details = [
// //   {
// //     'title': 'CRS20',
// //     'subtitle': '1234567899900vh',
// //     'image': 'assets/images/img2.png',
// //     'mainimg': 'assets/images/space.png',
// //   },
// //   {
// //     'title': 'CRS20',
// //     'subtitle': 'hksxLGALIuchvkxut',
// //     'image': 'assets/images/img1.png',
// //     'mainimg': 'assets/images/space.png',
// //   },
// //   {
// //     'title': 'CRS20',
// //     'subtitle': 'steukjfkut,jk,kkutyjxj',
// //     'image': 'assets/images/img2.png',
// //     'mainimg': 'assets/images/space.png',
// //   },
// // ];

// // void getdetails() async {
// //   var response = await Dio().get('https://api.spacexdata.com/v2/launches');
// //   print(response.data);
// //   print(response.data.length);
// //   print(response.data[1]);
// // }

// ///                     ***********************

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

// ***** my before trial
// Future getApiData() async {
//   var url = Uri.parse('https://api.spacexdata.com/v2/launches/');
//   Response response = await get(url);
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     for (int i = 0; i < (response.body.length); i++) {
//       // print('success');
//       final flight_number = data[i]['flight_number'];
//       final mission_name = data[i]['mission_name'];
//       final rocket_id = data[i]['rocket']['rocket_id'];
//       print(flight_number);
//       print(mission_name);
//       print(rocket_id);
//     }
//   } else {
//     print('something went wrong');
//   }
//   // print(response);
// }

Future getApiData() async {
  var response =
      await https.get(Uri.parse('https://api.spacexdata.com/v2/launches/'));
  var jsonData = jsonDecode(response.body);
  List<Spacex> launches = [];
  for (var u in jsonData) {
    Spacex spacex = Spacex(
      u['launch_year'],
      u['mission_name'],
      u['static_fire_date_utc'],
      u['details'],
      u['links']['mission_patch'],
    );
    launches.add(spacex);
  }
  print(launches.length);
  return launches;
}

class Spacex {
  // Links links;
  String launch_year;
  String mission_name;
  String static_fire_date_utc;
  String details;
  String mission_patch;

  Spacex(
    // required this.links,
    this.launch_year,
    this.mission_name,
    this.static_fire_date_utc,
    this.details,
    this.mission_patch,
  );
}
