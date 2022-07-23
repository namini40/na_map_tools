import 'package:na_map_tools/models/coordinate_system.dart';

/// base class for World Geodetic System
/// you can read more about it here: https://en.wikipedia.org/wiki/World_Geodetic_System
class WGS extends CoordinateSystem {
  double? _latitude, _longitude;

  WGS.fronLatLon(double latitude, double longitude) {
    if (isValid(latitude: latitude, longitude: longitude)) {
      _latitude = latitude;
      _longitude = longitude;
    }
  }

  static bool isValid({required double latitude, required double longitude}) {
    return latitude > 90.0 ||
        latitude < -90.0 ||
        longitude > 180.0 ||
        longitude < -180.0;
  }
}
