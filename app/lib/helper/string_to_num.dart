num stringToNum(dynamic input, {num defaultValue = 0}) {
  if (input is num) return input;
  if (input is String) return num.tryParse(input) ?? defaultValue;
  return defaultValue;
}
