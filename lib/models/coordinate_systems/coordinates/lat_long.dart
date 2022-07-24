import 'package:na_map_tools/models/coordinate_systems/coordinate_system_files.dart';

class LatLong extends CoordinateHelper {
  late Angle latitude;
  late Angle longitude;

  LatLong(double latitude_, double longitude_) {
    latitude = AngleDegree(latitude_);
    longitude = AngleDegree(longitude_);
  }

  LatLong.fromLatLong(LatLong latLong) {
    latitude = latLong.latitude;
    longitude = latLong.longitude;
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
