import 'package:na_map_tools/models/coordinate_system.dart';

/// base class for Universal Transverse Mercator coordinate system
/// you can read more about it here: https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system
class UTM extends CoordinateSystem {
  int? zone;
  double? northing, easting;
}
