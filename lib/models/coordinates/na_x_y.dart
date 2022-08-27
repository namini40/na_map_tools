import 'package:na_map_tools/models/basics_units/distance/distance.dart';
import 'package:na_map_tools/models/coordinates/na_coordinate.dart';
import 'package:na_map_tools/utils/na_calculator.dart';

class NaXY extends NaCoordinate {
  double X;
  double Y;

  NaXY({required this.X, required this.Y, String name = ''}) {
    this.name = name;
  }

  @override
  Distance euclideanDistance(NaCoordinate to) {
    if (to is NaXY) {
      return Distance(
        NaCalculator.euclideanDistance2D(this.X, this.Y, to.X, to.Y),
      );
    } else {
      throw Exception(
          '${to.runtimeType} is not subType of NaXY. make sure to use NaXY Type!');
    }
  }
}
