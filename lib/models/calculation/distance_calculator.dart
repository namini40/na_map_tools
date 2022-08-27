import 'package:na_map_tools/models/coordinates/na_coordinate.dart';

import '../basics_units/distance/distance.dart';

abstract class DistanceCalculator {
  Distance euclideanDistance(NaCoordinate to);
}
