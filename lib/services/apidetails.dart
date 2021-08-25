// import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
// import 'package:space_x/screens/details.dart';
import 'package:space_x/models/api_model.dart';

List<Map> details = [
  {
    'title': 'CRS20',
    'subtitle': '1234567899900vh',
    'image': 'assets/images/img2.png',
    'mainimg': 'assets/images/space.png',
  },
  {
    'title': 'CRS20',
    'subtitle': 'hksxLGALIuchvkxut',
    'image': 'assets/images/img1.png',
    'mainimg': 'assets/images/space.png',
  },
  {
    'title': 'CRS20',
    'subtitle': 'steukjfkut,jk,kkutyjxj',
    'image': 'assets/images/img2.png',
    'mainimg': 'assets/images/space.png',
  },
];

class ApiService {
  final endPointUrl = "https://api.spacexdata.com/v2/launches";

  Future<List<Links>> getLinks() async {
    var res = await Dio().get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.data);

      List<dynamic> data = json['links'];

      List<Links> links =
          data.map((dynamic item) => Links.fromJson(item)).toList();

      return links;
    } else {
      throw ("Can't get the Details");
    }
  }
}


// void getdetails() async {
//   var response = await Dio().get('https://api.spacexdata.com/v2/launches');
//   print(response.data.length);
// }
