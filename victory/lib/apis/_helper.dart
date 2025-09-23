part of 'apis.dart';

List<T> Function(Map<String, dynamic> json) mapToValueList<T>(T Function(Map<String, dynamic> json) decoder) {
  return (json) {
    return List<T>.from(json.values.map((x) => decoder(x)).toList());
  };
}
