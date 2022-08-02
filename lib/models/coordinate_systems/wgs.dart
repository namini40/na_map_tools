import 'coordinate_system_files.dart';

/// base class for World Geodetic System
/// you can read more about it here: https://en.wikipedia.org/wiki/World_Geodetic_System
class WGS extends CoordinateSystem {
  static final A_semiMajorAxis = Distance(6378137.0);
  static const f_flatteringFactor = 298.257223563;
  static const w_nominalMeanAngularVelocity = 0.00007292115; // radian/sec

  Angle latitude, longitude;

  WGS({required this.latitude, required this.longitude});

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
}
