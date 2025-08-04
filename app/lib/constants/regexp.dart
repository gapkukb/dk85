// ignore_for_file: non_constant_identifier_names

final REGEXP_PASSWORD = RegExp(r'\w{6,20}');
final REGEXP_email = RegExp(r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");
final REGEXP_ACCOUNT = RegExp(r'^[a-zA-Z][a-zA-Z0-9]{5,19}$', caseSensitive: false);
final REGEXP_MOBILE_NUMBER = RegExp(r"^0?95\\d{8}$");
