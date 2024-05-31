import 'package:tailboard_app/models/unit.dart';

class Quantity {
  final double value;
  final Unit unit;

  const Quantity({
    required this.value,
    required this.unit,
  });

  Quantity standardize() {
    return Quantity(
      // Get the base value
      value: value * unit.multiplier,
      // Get the base unit
      unit: unit.baseUnit(),
    );
  }

  @override
  String toString() {
    return "$value $unit";
  }

  @override
  int get hashCode => Object.hash(value, unit);

  @override
  bool operator ==(covariant Quantity other) =>
      value == other.value && unit == other.unit;

  Quantity operator +(covariant Quantity other) {
    if (!unit.isCompatible(other.unit)) {
      throw FormatException(
          '${unit.name} and ${other.unit.name} are not compatible for addition!');
    }
    Quantity a = standardize();
    Quantity b = other.standardize();
    // print("Add: $this + $other");
    // print(a);
    // print(b);
    return Quantity(
      value: (a.value + b.value) * unit.multiplier,
      unit: unit,
    );
  }

  Quantity operator -(covariant Quantity other) {
    return this + Quantity(value: -other.value, unit: other.unit);
  }

  Quantity operator *(covariant Quantity other) {
    Unit resultUnit = Unit(
      multiplier: unit.multiplier * other.unit.multiplier,
      name: "???",
      symbol: "?",
      length: unit.length + other.unit.length,
      time: unit.time + other.unit.time,
      mass: unit.mass + other.unit.mass,
    );
    return Quantity(value: value * other.value, unit: resultUnit);
  }

  Quantity operator /(covariant Quantity other) {
    Unit resultUnit = Unit(
      multiplier: unit.multiplier / other.unit.multiplier,
      name: "???",
      symbol: "?",
      length: unit.length - other.unit.length,
      time: unit.time - other.unit.time,
      mass: unit.mass - other.unit.mass,
    );
    return Quantity(value: value / other.value, unit: resultUnit);
  }

  bool equivalent(covariant Quantity other) =>
    standardize() == other.standardize();

  Quantity convert(Unit target) {
    if (!unit.isCompatible(target)) {
      throw FormatException('Cannot convert ${unit.name} to ${target.name}!');
    }
    return Quantity(
      value: value * unit.multiplier / target.multiplier,
      unit: target,
    );
  }
}
