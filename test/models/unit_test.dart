import 'package:test/test.dart';
import 'package:tailboard_app/models/unit.dart';

void main() {
  group('isCompatible', () {
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

  group('equivalent', () {
    test('inequivalent units', () {
      expect(const Unit(multiplier: 1.0, name: 'a', symbol: 'a', length: 1).equivalent(const Unit(multiplier: 2.0, name: 'a', symbol: 'a', length: 1)), false);
      expect(const Unit(multiplier: 1.0, name: 'a', symbol: 'a', length: 1).equivalent(const Unit(multiplier: 1.0, name: 'a', symbol: 'a', length: 2)), false);
    });
    test('equivalent units', () {
      expect(const Unit(multiplier: 1.0, name: 'a', symbol: 'a', length: 1).equivalent(const Unit(multiplier: 1.0, name: 'a', symbol: 'a', length: 1)), true);
      expect(const Unit(multiplier: 1.0, name: 'a', symbol: 'a', length: 1).equivalent(const Unit(multiplier: 1.0, name: 'b', symbol: 'b', length: 1)), true);
    });
  });
}