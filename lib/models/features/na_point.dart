import 'package:na_map_tools/models/coordinates/na_coordinate.dart';

import '../basics_units/distance/distance.dart';
import '../calculation/distance_calculator.dart';
import 'feature.dart';

class NaPoint<T extends NaCoordinate> implements Feature, DistanceCalculator {
  T coordinate;

  NaPoint({required this.coordinate, String name = ''}) {
    if (coordinate.name.isEmpty || name.isNotEmpty) {
      coordinate.name = name;
    }
  }

  @override
  Distance euclideanDistance(NaCoordinate to) {
    return coordinate.euclideanDistance(to);
  }
}
