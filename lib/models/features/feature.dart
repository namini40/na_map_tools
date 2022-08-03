import 'package:na_map_tools/models/coordinate_systems/coordinate_system_files.dart';

abstract class Feature {
  bool isInBuffer(LatLong latLong);
  Distance distanceFrom(Feature feature);
}
