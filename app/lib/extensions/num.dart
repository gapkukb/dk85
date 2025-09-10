extension NumDisplayExt on num {
  display() => toDouble().display();
}

extension DoubleDisplayExt on double {
  display() {
    if (this == toInt()) return truncate().toString();
    return toString();
  }
}
