import 'api_model.dart';

class Spacex {
  late Links links;
  late String flight_number;
  late String mission_name;
  late String static_fire_date_utc;
  late String details;

  Spacex({
    required this.links,
    required this.flight_number,
    required this.mission_name,
    required this.static_fire_date_utc,
    required this.details,
  });

  factory Spacex.fromJson(Map<String, dynamic> json) {
    return Spacex(
      links: Links.fromJson(json['links']),
      flight_number: json['flight_number'] as String,
      mission_name: json['mission_name'] as String,
      static_fire_date_utc: json['static_fire_date_utc'] as String,
      details: json['details'] as String,
    );
  }
}
