import '../../coordinate_system_files.dart';

abstract class Angle extends Unit {
  AngleDegree toDegree();
  AngleDMS toDMS();
  AngleRadian toRadian();

  Angle operator +(Angle other);
  Angle operator -(Angle other);
}