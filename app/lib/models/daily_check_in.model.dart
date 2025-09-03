import 'package:meta/meta.dart';
import 'dart:convert';

class DailyCheckInModelWrapper {
  final num code;
  final num status;
  final String message;
  final List<DailyCheckInModel> data;

  DailyCheckInModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory DailyCheckInModelWrapper.fromRawJson(String str) => DailyCheckInModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyCheckInModelWrapper.fromJson(Map<String, dynamic> json) =>
      DailyCheckInModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: List<DailyCheckInModel>.from(json["data"].map((x) => DailyCheckInModel.fromJson(x))));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": List<dynamic>.from(data.map((x) => x.toJson()))};
}

class DailyCheckInModel {
  final DateTime date;
  final num status;
  final dynamic amount;

  DailyCheckInModel({required this.date, required this.status, required this.amount});

  factory DailyCheckInModel.fromRawJson(String str) => DailyCheckInModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyCheckInModel.fromJson(Map<String, dynamic> json) => DailyCheckInModel(date: DateTime.parse(json["date"]), status: json["status"], amount: json["amount"]);

  Map<String, dynamic> toJson() => {"date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}", "status": status, "amount": amount};
}
