extension Strings on String {
  bool isEmptyOrNull() {
    if (this == 'null') return true;
    return this.isEmpty;
  }

  bool get isNotEmptyOrNull => !isEmptyOrNull();

  double toDouble() => double.parse(this);
  int toInt() => int.parse(this);
}
