import 'basics_units/distance/distance.dart';
import 'coordinate_system.dart';

/// base class for Universal Transverse Mercator coordinate system
/// you can read more about it here: https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system
class UTM extends CoordinateSystem {
  late int zone;
  late Distance N;
  late Distance E;

  UTM(double N_, double E_) {
    N = Distance(N_);
    E = Distance(E_);
  }

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
