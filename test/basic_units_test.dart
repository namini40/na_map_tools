import 'package:flutter_test/flutter_test.dart';
import 'package:na_map_tools/models/basics_units/angle/angle.dart';

/// testing basic units part of library

void main() {
  group('test angle', () {
    double rawAngleValue1 = 123.456;
    double rawAngleValue2 = 123;
    double rawAngleValue3 = -123.456;
    double rawAngleValue4 = -123;

    test('object formation', () {
      var angle1 = Angle(rawAngleValue1);
      var angle2 = Angle(rawAngleValue2);
      var angle3 = Angle(rawAngleValue3);
      var angle4 = Angle(rawAngleValue4);
      expect(angle1.value, rawAngleValue1);
      expect(angle2.value, rawAngleValue2);
      expect(angle3.value, rawAngleValue3);
      expect(angle4.value, rawAngleValue4);
    });
  });
}
