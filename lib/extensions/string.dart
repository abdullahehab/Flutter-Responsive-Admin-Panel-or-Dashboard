extension Strings on String {
  bool isEmptyOrNull() => this.isEmpty;

  bool get isNotEmptyOrNull => !isEmptyOrNull();

  double toDouble() => double.parse(this);
  int toInt() => int.parse(this);
}
