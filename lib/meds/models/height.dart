class Height {
  final double value; // meters

  const Height(this.value);

  String formatM() {
    return "${value.toStringAsFixed(3)} m";
  }

  String formatCm() {
    return "${(100 * value).toStringAsFixed(0)} cm";
  }

  String formatFI() {
    int inches = (value * 39.3701).round();
    int ft = (inches / 12).floor();
    int i = (inches - (12 * ft)).round();
    return '$ft\' $i"';
  }
}