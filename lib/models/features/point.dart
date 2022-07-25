import 'package:na_map_tools/models/calculation/calculation_files.dart';
import 'package:na_map_tools/models/coordinate_systems/coordinate_system_files.dart';
import 'package:na_map_tools/models/features/features_files.dart';

import 'feature.dart';

class Point extends WGS implements Feature, DistanceCalculator {
  late LatLong coordinates;

  Point(LatLong latLong) {
    coordinates = coordinates;
  }

  Point.from({required double latitude, required double longitude}) {
    var p = LatLong(latitude, longitude);
    Point(p);
  }

  @override
  CoordinateSystem toUTM() {
    // TODO: implement toUTM
    throw UnimplementedError();
  }

  @override
  CoordinateSystem toWGS() {
    // TODO: implement toWGS
    throw UnimplementedError();
  }

  @override
  bool isInBuffer(LatLong latLong) {
    // TODO: implement isInBuffer
    throw UnimplementedError();
  }

  @override
  Distance distanceFrom(Feature feature) {
    var distance = Distance.zero();
    if (feature is Point) {
    } else {
      throw UnimplementedError();
    }
    return distance;
  }

  @override
  Distance euclideanDistance(Feature from, Feature to) {
    throw UnimplementedError();
  }
}
