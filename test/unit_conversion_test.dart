import 'package:tailboard_app/models/quantity.dart';
import 'package:tailboard_app/models/unit.dart';
import 'package:test/test.dart';

void main() {
  group('Unit.isCompatible', () {
    test('compatible units', () {
      const Unit a = Unit(
        multiplier: 1.0,
        name: 'a',
        symbol: 'a',
        length: 1,
      );
      const Unit b = Unit(
        multiplier: 2.0,
        name: 'b',
        symbol: 'b',
        length: 1,
      );
      expect(a.isCompatible(b), true);
      expect(b.isCompatible(a), true);
    });
    test('incompatible units', () {
      const Unit a = Unit(
        multiplier: 1.0,
        name: 'a',
        symbol: 'a',
        length: 1,
      );
      const Unit b = Unit(
        multiplier: 2.0,
        name: 'b',
        symbol: 'b',
        length: 2,
      );
      expect(a.isCompatible(b), false);
      expect(b.isCompatible(a), false);
    });
  });

  group('Quantity.convert', () {
    test('compatible units', () {
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).convert(LENGTH.centimeter.unit).value, 100);
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).convert(LENGTH.kilometer.unit).value, 0.001);
    });
  });
}