import 'package:na_map_tools/models/basics_units/angle/angle.dart';
import 'package:na_map_tools/models/basics_units/distance/distance.dart';
import 'package:na_map_tools/models/coordinates/na_coordinate.dart';
import 'package:na_map_tools/utils/na_calculator.dart';

class NaLatLong extends NaCoordinate {
  Angle latitude;
  Angle longitude;

  NaLatLong(
      {required this.latitude, required this.longitude, String name = ''}) {
    this.name = name;
  }

  @override
  Distance euclideanDistance(NaCoordinate to) {
    if (to is NaLatLong) {
      return Distance(
        NaCalculator.euclideanDistance2D(this.latitude.value,
            this.longitude.value, to.latitude.value, to.longitude.value),
      );
    } else {
      throw Exception(
          '${to.runtimeType} is not subType of NaLatLong! make sure to use NaLatLong Type!');
    }
  }
}
