import 'package:app/helper/string_to_num.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class FundRecordsWrapper {
  final num code;
  final num status;
  final String message;
  final FundRecords data;

  FundRecordsWrapper({required this.code, required this.status, required this.message, required this.data});

  factory FundRecordsWrapper.fromRawJson(String str) => FundRecordsWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundRecordsWrapper.fromJson(Map<String, dynamic> json) =>
      FundRecordsWrapper(code: json["code"], status: json["status"], message: json["message"], data: FundRecords.fromJson(json["data"] ?? {}));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data.toJson()};
}

class FundRecords {
  final num totalRecharge;
  final num totalWithdraw;
  final num totalBonus;
  final num totalRebate;
  final List<FundRecord> list;
  final num count;

  FundRecords({required this.totalRecharge, required this.totalWithdraw, required this.totalBonus, required this.totalRebate, required this.list, required this.count});

  factory FundRecords.fromRawJson(String str) => FundRecords.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundRecords.fromJson(Map<String, dynamic> json) => FundRecords(
    totalRecharge: stringToNum(json["total_recharge"]),
    totalWithdraw: stringToNum(json["total_withdraw"]),
    totalBonus: stringToNum(json["total_bonus"]),
    totalRebate: stringToNum(json["total_rebate"]),
    list: List<FundRecord>.from((json["list"] ?? []).map((x) => FundRecord.fromJson(x))),
    count: json["count"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "total_recharge": totalRecharge,
    "total_withdraw": totalWithdraw,
    "total_bonus": totalBonus,
    "total_rebate": totalRebate,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "count": count,
  };
}

class FundRecord {
  final String channel;
  final String tradeNo;
  final num money;
  final String remark;
  final num type;
  final num symbol;
  final int status;
  final String time;
  final int changeType;

  FundRecord({
    required this.channel,
    required this.tradeNo,
    required this.money,
    required this.remark,
    required this.type,
    required this.symbol,
    required this.status,
    required this.time,
    required this.changeType,
  });

  factory FundRecord.fromRawJson(String str) => FundRecord.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundRecord.fromJson(Map<String, dynamic> json) => FundRecord(
    channel: json["channel"] ?? '',
    tradeNo: json["trade_no"] ?? '',
    money: stringToNum(json["money"]),
    remark: json["remark"] ?? '',
    type: json["type"] ?? 0,
    symbol: json["symbol"] ?? 0,
    status: json["status"] ?? 0,
    time: json["time"] ?? '',
    changeType: json["change_type"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "trade_no": tradeNo,
    "money": money,
    "remark": remark,
    "type": type,
    "symbol": symbol,
    "status": status,
    "time": time,
    "changeType": changeType,
    "channel": channel,
  };
}
