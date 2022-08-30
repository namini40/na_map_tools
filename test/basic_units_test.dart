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

      var angleDms = Angle.fromDMS(degree: 12, minutes: 23, seconds: 32.1);
      expect(angleDms.value.toStringAsPrecision(5),
          12.39225.toStringAsPrecision(5));
    });

    test('operator testing', () {
      var angle1 = Angle(rawAngleValue1);
      var angle2 = Angle(rawAngleValue2);
      var angle3 = Angle(rawAngleValue3);
      var angle4 = Angle(rawAngleValue4);

      // addition
      var actualSum = rawAngleValue1 + rawAngleValue2;
      expect(actualSum, (angle1 + angle2).value);

      // subtract
      var actualSub = rawAngleValue1 - rawAngleValue2;
      expect(actualSub, (angle1 - angle2).value);
    });
  });
}
