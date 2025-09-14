import 'package:meta/meta.dart';
import 'dart:convert';

class DailyCheckInModelWrapper {
  final num code;
  final num status;
  final String message;
  final DailyCheckInOuterModel data;

  DailyCheckInModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory DailyCheckInModelWrapper.fromRawJson(String str) => DailyCheckInModelWrapper.fromJson(json.decode(str));

  factory DailyCheckInModelWrapper.fromJson(Map<String, dynamic> json) =>
      DailyCheckInModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: DailyCheckInOuterModel.fromJson(json['data'] ?? {}));
}

class DailyCheckInOuterModel {
  final List<DailyCheckInModel> list;
  final String rules;

  DailyCheckInOuterModel({required this.list, required this.rules});

  factory DailyCheckInOuterModel.fromJson(Map<String, dynamic> json) =>
      DailyCheckInOuterModel(rules: json["rules"] ?? '', list: List<DailyCheckInModel>.from((json["list"] ?? []).map((x) => DailyCheckInModel.fromJson(x))));
}

class DailyCheckInModel {
  final DateTime date;
  final num status;
  final dynamic amount;

  DailyCheckInModel({required this.date, required this.status, required this.amount});

  factory DailyCheckInModel.fromRawJson(String str) => DailyCheckInModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyCheckInModel.fromJson(Map<String, dynamic> json) => DailyCheckInModel(date: DateTime.parse(json["date"]), status: json["status"], amount: json["amount"]);

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "status": status,
    "amount": amount,
  };
}
