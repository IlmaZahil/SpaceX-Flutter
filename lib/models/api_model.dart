import 'dart:convert';

// Links linksFromJson(String str) => links.fromJson(json.decode(str));

// String linksToJson(Links data) => json.encode(data.toJson());

class Links {
  String mission_path;
  String mission_path_small;
  List<Spacex> spacex;

  Links(
      {required this.mission_path,
      required this.mission_path_small,
      required this.spacex});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        mission_path: json['mission_path'],
        mission_path_small: json['mission_path_small'],
        spacex: List<Spacex>.from(json['spacex'].map((x) => Links.fromJson(x))),
      );
}

class Spacex {
  Links links;
  String flight_number;
  String mission_name;
  String static_fire_date_utc;
  String details;

  Spacex({
    required this.links,
    required this.flight_number,
    required this.mission_name,
    required this.static_fire_date_utc,
    required this.details,
  });

  factory Spacex.fromJson(Map<String, dynamic> json) => Spacex(
        mission_name: json['mission_name'],
        static_fire_date_utc: json['static_fire_date_utc'],
        flight_number: json['flight_number'],
        details: json['details'],
        links: json['links'],
      );
}
