import 'dart:math';

class Weight {
  final double value; // kilograms

  Weight(this.value);

  // Weight.fromHeight(double height) : value = 100.0 * (height - 1);
  Weight.fromHeight(double height) : value = 13.0 * pow(height, 3.0); // Estimate from corpulence index of 13

  String formatKg() {
    return "${value.toStringAsFixed(1)} kg";
  }
  
  String formatLb() {
    return "${(value * 2.20462).toStringAsFixed(0)} lbs";
  }
}