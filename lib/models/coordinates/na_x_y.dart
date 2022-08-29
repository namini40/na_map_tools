import 'package:na_map_tools/models/basics_units/distance/distance.dart';
import 'package:na_map_tools/models/coordinates/na_coordinate.dart';
import 'package:na_map_tools/utils/na_calculator.dart';

class NaXY extends NaCoordinate {
  Distance X;
  Distance Y;

  NaXY({required this.X, required this.Y, String name = ''}) {
    this.name = name;
  }

  @override
  Distance euclideanDistance(NaCoordinate to) {
    if (to is NaXY) {
      return Distance(
        NaCalculator.euclideanDistance2D(
            this.X.value, this.Y.value, to.X.value, to.Y.value),
      );
    } else {
      throw Exception(
          '${to.runtimeType} is not subType of NaXY. make sure to use NaXY Type!');
    }
  }

  NaXY operator +(NaXY other) {
    X += other.X;
    Y += other.Y;
    return this;
  }

  NaXY operator -(NaXY other) {
    X -= other.X;
    Y -= other.Y;
    return this;
  }
}
