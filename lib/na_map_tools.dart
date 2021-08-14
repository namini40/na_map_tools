/*
created by Nasser Amini ,July 2021
gmail  : namini40@gmail.com
github : https://github.com/namini40
twitter: https://twitter.com/na3r_amini
youtube: https://www.youtube.com/c/NasserAmini
 */

import 'dart:convert';
import 'package:na_map_tools/data.dart';
import 'dart:math';

part 'cities.dart';
part 'Geolocation.dart';

class NaMapTools {
  NaMapTools() {
    if (cityList.isEmpty) _readData();
  }

  List<City> cityList = [];

  _readData() {
    this.cityList = cityFromJson(data);
  }

  City findClosestCity(GeoLocation geoLocation) {
    double minDist = double.maxFinite;
    int indexOfMin = 0;
    for (int i = 0; i < this.cityList.length; i++) {
      double dist = geoLocation.euclideanDistance(this.cityList[i].geoLocation);
      if (dist <= minDist) {
        minDist = dist;
        indexOfMin = i;
      }
    }

    return this.cityList[indexOfMin];
  }
}
