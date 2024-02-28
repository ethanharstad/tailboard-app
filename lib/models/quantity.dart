import 'package:tailboard_app/models/unit.dart';

class Quantity {
  final double value;
  final Unit unit;

  const Quantity({
    required this.value,
    required this.unit,
  });

  Quantity convert(Unit target) {
    if (!unit.isCompatible(target)) {
      throw FormatException('Cannot convert ${unit.name} to ${target.name}!');
    }
    return Quantity(
      value: value / unit.multiplier * target.multiplier,
      unit: target,
    );
  }
}
