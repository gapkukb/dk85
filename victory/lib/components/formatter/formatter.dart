import 'package:intl/intl.dart';

class _DateTime {
  static final _full = DateFormat('yyyy-MM-dd HH:mm:ss');
  static final _date = DateFormat('yyyy-MM-dd');
  static final _time = DateFormat('HH:mm:ss');
  static final _start = DateFormat('yyyy-MM-dd 00:00:00');
  static final _end = DateFormat('yyyy-MM-dd 23:59:59');
  static final _dmmm = DateFormat('d-MMM');

  DateTime? _parse(dynamic value) {
    if (value is DateTime) return value;
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    if (value is String) {
      final c = int.tryParse(value);
      if (c != null) return DateTime.fromMillisecondsSinceEpoch(c);
      final d = DateTime.tryParse(value);
      if (d != null) return d;
    }
    return null;
  }

  String _format(dynamic value, DateFormat formatter) {
    final d = _parse(value);
    if (d == null) return 'Invalid date';
    return formatter.format(d);
  }

  String format(dynamic value) {
    return _format(value, _full);
  }

  String start(dynamic value) {
    return _format(value, _start);
  }

  String end(dynamic value) {
    return _format(value, _end);
  }

  String time(dynamic value) {
    return _format(value, _time);
  }

  String date(dynamic value) {
    return _format(value, _date);
  }

  String dmmm(dynamic value) {
    return _format(value, _dmmm);
  }

  String custom(dynamic value, String template) {
    return _format(value, DateFormat(template));
  }
}

abstract class VicFormatter {
  static final dateTime = _DateTime();
}
