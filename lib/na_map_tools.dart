/*
created by Nasser Amini ,July 2021
gmail  : namini40@gmail.com
github : https://github.com/namini40
twitter: https://twitter.com/na3r_amini
 */

import 'dart:convert';
import 'dart:math';

import 'package:na_map_tools/data.dart';

part 'cities.dart';
part 'geolocation.dart';

class NaMapTools {
  NaMapTools() {
    if (cityList.isEmpty) _readData();
  }

  List<City> cityList = [];

  _readData() {
    cityList = cityFromJson(data);
  }

  City findClosestCity(GeoLocation geoLocation) {
    double minDist = double.maxFinite;
    int indexOfMin = 0;
    for (int i = 0; i < cityList.length; i++) {
      double dist = geoLocation.euclideanDistance(cityList[i].geoLocation);
      if (dist <= minDist) {
        minDist = dist;
        indexOfMin = i;
      }
    }

    return cityList[indexOfMin];
  }
}
