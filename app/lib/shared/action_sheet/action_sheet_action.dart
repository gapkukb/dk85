part of 'action_sheet.dart';

class ActionSheetAction<T> {
  final String title;
  final String? label;
  final T value;

  ActionSheetAction({required this.title, required this.value, this.label});
}
