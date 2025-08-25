part of 'index.dart';

class Choose<T> {
  final String title;
  final T value;
  final String? label;

  Choose({required this.title, required this.value, this.label});
}
