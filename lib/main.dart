import 'package:flutter/material.dart';
// import 'package:space_x/screens/details.dart';
import 'package:space_x/screens/login_page.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

import 'package:space_x/models/api_model.dart';
import 'package:space_x/services/apidetails.dart';

// class Spacex {
//   // Links links;
//   String launch_year;
//   String mission_name;
//   String static_fire_date_utc;
//   String details;

//   Spacex({
//     // required this.links,
//     required this.launch_year,
//     required this.mission_name,
//     required this.static_fire_date_utc,
//     required this.details,
//   });

//   factory Spacex.fromJson(Map<String, dynamic> json) {
//     return Spacex(
//       mission_name: json['mission_name'],
//       static_fire_date_utc: json['static_fire_date_utc'],
//       launch_year: json['launch_year'],
//       details: json['details'],
//       // links: json['links'],
//     );
//   }
// }

// Future<Spacex> getApiData() async {
//   final response =
//       await https.get(Uri.parse('https://api.spacexdata.com/v2/launches'));
//   // Response response = await get(url);
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     return Spacex.fromJson(jsonDecode(data.body));
//     // for (int i = 0; i < (response.body.length); i++) {
//     //   // print('success');
//     //   final flight_number = data[i]['flight_number'];
//     //   final mission_name = data[i]['mission_name'];
//     //   final rocket_id = data[i]['rocket']['rocket_id'];
//     //   print(flight_number);
//     //   print(mission_name);
//     //   print(rocket_id);
//     // }
//   } else {
//     throw Exception('something went wrong');
//   }
//   // print(response);
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Color(0xffA4B2A5),
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late Future<Spacex> spacexDetails;
  // @override
  // void initState() {
  //   super.initState();
  //   spacexDetails = getApiData();
  // }

  @override
  Widget build(BuildContext context) {
    getApiData();
    return MaterialApp(
        // title: 'Fetch Data Example',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Fetch Data Example'),
        //   ),
        //   body: Center(
        //     child: FutureBuilder<Spacex>(
        //       // future: spacexDetails,
        //       builder: (context, snapshot) {
        //         if (snapshot.hasData) {
        //           return Text(snapshot.data!.mission_name);
        //         } else if (snapshot.hasError) {
        //           return Text('${snapshot.error}');
        //         }

        //         // By default, show a loading spinner.
        //         return const CircularProgressIndicator();
        //       },
        //     ),
        //   ),
        // ),
        );
  }
}
