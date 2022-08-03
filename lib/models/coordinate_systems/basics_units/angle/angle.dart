import '../../coordinate_system_files.dart';

mixin Angle {
  AngleDegree toDegree();
  AngleDMS toDMS();
  AngleRadian toRadian();

  Angle operator +(Angle other);
  Angle operator -(Angle other);
}
