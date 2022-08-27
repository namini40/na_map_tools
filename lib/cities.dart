// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

import 'package:na_map_tools/models/basics_units/angle/angle.dart';
import 'package:na_map_tools/models/coordinates/na_coordinate.dart';
import 'package:na_map_tools/models/coordinates/na_lat_long.dart';

import 'models/features/na_point.dart';

List<City> cityFromJson(String str) =>
    List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

class City extends NaPoint {
  String province;

  City({required NaCoordinate coordinate, required this.province})
      : super(coordinate: coordinate);

  factory City.fromJson(Map<String, dynamic> json) => City(
        province: json["State"],
        coordinate: NaLatLong(
          latitude: Angle(double.parse(json["phi"])),
          longitude: Angle(double.parse(json[" lambda"])),
          name: json["City"],
        ),
      );
}
