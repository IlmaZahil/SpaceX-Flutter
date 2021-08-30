import 'package:http/http.dart' as https;
import 'dart:convert';

import 'package:space_x/models/spacex_model.dart';

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
      u['links']['mission_patch_small'],
    );
    launches.add(spacex);
  }
  print(launches.length);
  return launches;
}
