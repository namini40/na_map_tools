import '../coordinate_systems/coordinate_system_files.dart';
import '../features/features_files.dart';

abstract class DistanceCalculator {
  Distance euclideanDistance(Feature from, Feature to);
}
