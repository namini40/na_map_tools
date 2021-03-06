part of 'na_map_tools.dart';

class GeoLocation {
  double? latitude;
  double? longitude;
  String? name;

  GeoLocation({this.latitude, this.longitude, this.name});

  double euclideanDistance(GeoLocation from) {
    return sqrt(pow(latitude! - from.latitude!, 2) +
        pow(longitude! - from.longitude!, 2));
  }

  @override
  String toString() {
    return '($latitude,$longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    if (latitude == null || longitude == null) {
      return false;
    } else {
      return latitude == other.latitude && longitude == other.longitude;
    }
  }
}
