class Unit {
  final double multiplier;
  final String name;
  final String symbol;
  final int length;
  final int time;
  final int mass;

  const Unit({
    required this.multiplier,
    required this.name,
    required this.symbol,
    this.length = 0,
    this.time = 0,
    this.mass = 0,
  });

  @override
  String toString() {
    return "$name {$symbol ($multiplier)}";
  }

  @override
  int get hashCode => Object.hash(multiplier, name, symbol, length, time, mass);

  @override
  bool operator ==(covariant Unit other) =>
      multiplier == other.multiplier &&
      name == other.name &&
      symbol == other.symbol &&
      length == other.length &&
      time == other.time &&
      mass == other.mass;

  bool equivalent(covariant Unit other) =>
      multiplier == other.multiplier &&
      length == other.length &&
      time == other.time &&
      mass == other.mass;

  Unit baseUnit() {
    return Unit(
      multiplier: 1.0,
      name: "Standard($length, $time, $mass)",
      symbol: "($length, $time, $mass)",
      length: length,
      time: time,
      mass: mass,
    );
  }

  bool isCompatible(Unit other) {
    return length == other.length && time == other.time && mass == other.mass;
  }
}

enum LENGTH {
  kilometer(
      Unit(multiplier: 1000, name: 'kilometer', symbol: 'km', length: 1)),
  meter(Unit(multiplier: 1.0, name: 'meter', symbol: 'm', length: 1)),
  centimeter(
      Unit(multiplier: 1/100.0, name: 'centimeter', symbol: 'cm', length: 1)),
  millimeter(
      Unit(multiplier: 1.0/1000.0, name: 'millimeter', symbol: 'mm', length: 1)),
  inch(Unit(multiplier: 39.3701, name: 'inch', symbol: 'in', length: 1)),
  foot(Unit(multiplier: 3.280841666667, name: 'foot', symbol: 'ft', length: 1));

  final Unit unit;

  const LENGTH(this.unit);
}

enum TIME {
  second(Unit(multiplier: 1.0, name: 'second', symbol: 's', time: 1)),
  minute(Unit(multiplier: 60.0, name: 'minute', symbol: 'm', time: 1)),
  hour(Unit(multiplier: 60.0 * 60.0, name: 'hour', symbol: 'h', time: 1));

  final Unit unit;

  const TIME(this.unit);
}
