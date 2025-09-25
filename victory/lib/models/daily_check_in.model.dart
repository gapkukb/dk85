import 'package:victory/models/models.dart';

class DailyCheckInGroupModel extends VicBaseModel {
  DailyCheckInGroupModel({
    required this.list,
    required this.rules,
  });

  final List<VicDailyCheckInModel> list;
  final String rules;

  factory DailyCheckInGroupModel.fromJson(Map<String, dynamic> json) {
    return DailyCheckInGroupModel(
      list: json["list"] == null ? [] : List<VicDailyCheckInModel>.from(json["list"]!.map((x) => VicDailyCheckInModel.fromJson(x))),
      rules: json["rules"] ?? "",
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    "list": list.map((x) => x.toJson()).toList(),
    "rules": rules,
  };

  @override
  String toString() {
    return "$list, $rules, ";
  }
}

class VicDailyCheckInModel {
  VicDailyCheckInModel({
    required this.date,
    required this.status,
    required this.amount,
  });

  final DateTime? date;
  final num status;
  final dynamic amount;

  factory VicDailyCheckInModel.fromJson(Map<String, dynamic> json) {
    return VicDailyCheckInModel(
      date: DateTime.tryParse(json["date"] ?? ""),
      status: json["status"] ?? 0,
      amount: json["amount"],
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date.toString(),
    "status": status,
    "amount": amount,
  };

  @override
  String toString() {
    return "$date, $status, $amount, ";
  }
}
