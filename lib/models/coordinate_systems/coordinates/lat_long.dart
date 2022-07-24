import '../coordinate_system_files.dart';

class LatLong extends CoordinateHelper {
  late Angle latitude_;
  late Angle longitude_;

  LatLong(double latitude, double longitude) {
    latitude_ = AngleDegree(latitude);
    longitude_ = AngleDegree(longitude);
  }

  LatLong.fromLatitudeLongitude(
      {required double latitude, required double longitude}) {
    LatLong(latitude, longitude);
  }

  @override
  bool isValid() {
    return true;
  }
}
