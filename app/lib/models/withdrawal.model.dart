import 'package:app/helper/string_to_num.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class WithdrawalModelWrapper {
  final num code;
  final num status;
  final String message;
  final List<WithdrawlModel> data;

  WithdrawalModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory WithdrawalModelWrapper.fromRawJson(String str) => WithdrawalModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WithdrawalModelWrapper.fromJson(Map<String, dynamic> json) => WithdrawalModelWrapper(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    data: List<WithdrawlModel>.from((json["data"] ?? []).map((x) => WithdrawlModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": List<dynamic>.from(data.map((x) => x.toJson()))};
}

class WithdrawlModel {
  final num id;
  final num withdrawId;
  final num gateway;
  final String name;
  final num eachMin;
  final num eachMax;
  final num dailyMax;
  final num todayCount;
  final num todayAmount;
  final num status;
  final num sort;
  final num isDecimal;
  final num isnum;
  final String moneyList;
  final num isInput;
  final String remark;
  final String logo;

  WithdrawlModel({
    required this.id,
    required this.withdrawId,
    required this.gateway,
    required this.name,
    required this.eachMin,
    required this.eachMax,
    required this.dailyMax,
    required this.todayCount,
    required this.todayAmount,
    required this.status,
    required this.sort,
    required this.isDecimal,
    required this.isnum,
    required this.moneyList,
    required this.isInput,
    required this.remark,
    required this.logo,
  });

  factory WithdrawlModel.fromRawJson(String str) => WithdrawlModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WithdrawlModel.fromJson(Map<String, dynamic> json) => WithdrawlModel(
    id: json["id"],
    withdrawId: json["withdraw_id"] ?? 0,
    gateway: json["gateway"] ?? 0,
    name: json["name"] ?? '',
    eachMin: stringToNum(json["each_min"], defaultValue: double.infinity),
    eachMax: stringToNum(json["each_max"], defaultValue: double.negativeInfinity),
    dailyMax: stringToNum(json["daily_max"], defaultValue: double.infinity),
    todayCount: json["today_count"] ?? 0,
    todayAmount: stringToNum(json["today_amount"]),
    status: json["status"] ?? 0,
    sort: json["sort"] ?? 0,
    isDecimal: json["is_decimal"] ?? 0,
    isnum: json["is_num"] ?? 0,
    moneyList: json["moneyList"] ?? [],
    isInput: json["is_input"] ?? 0,
    remark: json["remark"] ?? '',
    logo: json["logo"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "withdraw_id": withdrawId,
    "gateway": gateway,
    "name": name,
    "each_min": eachMin,
    "each_max": eachMax,
    "daily_max": dailyMax,
    "today_count": todayCount,
    "today_amount": todayAmount,
    "status": status,
    "sort": sort,
    "is_decimal": isDecimal,
    "is_num": isnum,
    "moneyList": moneyList,
    "is_input": isInput,
    "remark": remark,
    "logo": logo,
  };
}
