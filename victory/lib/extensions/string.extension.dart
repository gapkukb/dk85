extension ToNumExtension on String {
  num toNum() {
    return num.tryParse(this) ?? 0;
  }

  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  double toDouble() {
    return double.tryParse(this) ?? 0.0;
  }
}
