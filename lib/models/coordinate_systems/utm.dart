import 'basics_units/distance/distance.dart';
import 'coordinate_system.dart';

/// base class for Universal Transverse Mercator coordinate system
/// you can read more about it here: https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system
class UTM extends CoordinateSystem {
  late int zone;
  late Distance N;
  late Distance E;

  UTM({required double N_, required double E_, required int zone_}) {
    N = Distance(N_);
    E = Distance(E_);
    zone = zone_;
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
