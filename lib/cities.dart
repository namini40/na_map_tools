// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

import 'namaptools_lib.dart';

List<City> cityFromJson(String str) =>
    List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

class City {
  City({required this.state, required this.city, required this.geoLocation});

  String state;
  String city;
  NaLocation geoLocation;

  factory City.fromJson(Map<String, dynamic> json) => City(
        state: json["State"],
        city: json["City"],
        geoLocation: NaLocation(
            latitude: double.parse(json["phi"]),
            longitude: double.parse(json[" lambda"])),
      );
}
