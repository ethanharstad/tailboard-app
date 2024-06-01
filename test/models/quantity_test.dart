import 'package:test/test.dart';
import 'package:tailboard_app/models/quantity.dart';
import 'package:tailboard_app/models/unit.dart';

void main() {
  group('standardize', () {
    test('standardize', () {
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).standardize().equivalent(Quantity(value: 1, unit: LENGTH.meter.unit)), true);
      expect(Quantity(value: 1, unit: LENGTH.centimeter.unit).standardize().equivalent(Quantity(value: 0.01, unit: LENGTH.meter.unit)), true);
      expect(Quantity(value: 1, unit: LENGTH.kilometer.unit).standardize().equivalent(Quantity(value: 1000.0, unit: LENGTH.meter.unit)), true);
    });
  });

  group('convert', () {
    test('incompatible units', () {
      expect(() => Quantity(value: 1, unit: LENGTH.meter.unit).convert(TIME.second.unit).value, throwsException);
    });
    test('compatible units', () {
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).convert(LENGTH.centimeter.unit).value, 100);
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).convert(LENGTH.kilometer.unit).value, 0.001);
    });
  });

  group('equivalent', () {
    test('equivalent', () {
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).equivalent(Quantity(value: 1, unit: LENGTH.meter.unit)), true);
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).equivalent(Quantity(value: 100, unit: LENGTH.centimeter.unit)), true);
    });
    test('inequivalent', () {
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).equivalent(Quantity(value: 2, unit: LENGTH.meter.unit)), false);
      expect(Quantity(value: 1, unit: LENGTH.meter.unit).equivalent(Quantity(value: 1, unit: TIME.second.unit)), false);
    });
  });

  group('addition', () {
    test('incompatible units', () {
      expect(() => Quantity(value: 1, unit: LENGTH.meter.unit) + Quantity(value: 1, unit: TIME.second.unit), throwsException);
    });
    test('compatible units', () {
      expect(Quantity(value: 1, unit: LENGTH.meter.unit) + Quantity(value: 1, unit: LENGTH.meter.unit), Quantity(value: 2, unit: LENGTH.meter.unit));
      expect(Quantity(value: 1, unit: LENGTH.meter.unit) + Quantity(value: 1, unit: LENGTH.centimeter.unit), Quantity(value: 1.01, unit: LENGTH.meter.unit));
    });
  });

  group('subtraction', () {
    test('incompatible units', () {
      expect(() => Quantity(value: 1, unit: LENGTH.meter.unit) + Quantity(value: 1, unit: TIME.second.unit), throwsException);
    });
    test('compatible units', () {
      expect(Quantity(value: 2, unit: LENGTH.meter.unit) - Quantity(value: 1, unit: LENGTH.meter.unit), Quantity(value: 1, unit: LENGTH.meter.unit));
      expect(Quantity(value: 2, unit: LENGTH.meter.unit) - Quantity(value: 1, unit: LENGTH.centimeter.unit), Quantity(value: 1.99, unit: LENGTH.meter.unit));
    });
  });

  group('multiplication', () {
    test('compatible units', () {
      expect(Quantity(value: 1, unit: LENGTH.meter.unit) * Quantity(value: 1, unit: LENGTH.meter.unit), const Quantity(value: 1, unit: Unit(multiplier: 1, name: "???", symbol: "?", length: 2)));
      expect(Quantity(value: 1, unit: LENGTH.meter.unit) * Quantity(value: 1, unit: TIME.second.unit), const Quantity(value: 1, unit: Unit(multiplier: 1, name: "???", symbol: "?", length: 1, time: 1)));
      expect(Quantity(value: 2, unit: LENGTH.meter.unit) * Quantity(value: 3, unit: TIME.minute.unit), const Quantity(value: 6, unit: Unit(multiplier: 60, name: "???", symbol: "?", length: 1, time: 1)));
    });
  });

  group('division', () {
    test('compatible units', () {
      expect(Quantity(value: 1, unit: LENGTH.meter.unit) / Quantity(value: 1, unit: LENGTH.meter.unit), const Quantity(value: 1, unit: Unit(multiplier: 1, name: "???", symbol: "?", length: 0)));
      expect(Quantity(value: 1, unit: LENGTH.meter.unit) / Quantity(value: 1, unit: TIME.second.unit), const Quantity(value: 1, unit: Unit(multiplier: 1, name: "???", symbol: "?", length: 1, time: -1)));
      Quantity result = Quantity(value: 2, unit: LENGTH.meter.unit) / Quantity(value: 3, unit: TIME.minute.unit);
      Quantity truth = const Quantity(value: 2/3, unit: Unit(multiplier: 1/60, name: "???", symbol: "?", length: 1, time: 1));
      expect(result.value, closeTo(truth.value, .001));
      expect(result.unit.multiplier, closeTo(truth.unit.multiplier, .001));
    });
  });
}