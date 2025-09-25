import 'dart:convert';

import 'package:victory/helper/string_to_num.dart';

class VicFundHistoryListModel {
  final num totalRecharge;
  final num totalWithdraw;
  final num totalBonus;
  final num totalRebate;
  final List<VicFundHisotryModel> list;
  final num count;

  VicFundHistoryListModel({
    required this.totalRecharge,
    required this.totalWithdraw,
    required this.totalBonus,
    required this.totalRebate,
    required this.list,
    required this.count,
  });

  factory VicFundHistoryListModel.fromRawJson(String str) => VicFundHistoryListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicFundHistoryListModel.fromJson(Map<String, dynamic> json) => VicFundHistoryListModel(
    totalRecharge: stringToNum(json["total_recharge"]),
    totalWithdraw: stringToNum(json["total_withdraw"]),
    totalBonus: stringToNum(json["total_bonus"]),
    totalRebate: stringToNum(json["total_rebate"]),
    list: List<VicFundHisotryModel>.from((json["list"] ?? []).map((x) => VicFundHisotryModel.fromJson(x))),
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

class VicFundHisotryModel {
  final String sysTradeNo;
  final String imageUrl;
  final String channel;
  final String tradeNo;
  final String cardNo;
  final num money;
  final String remark;
  final num type;
  final num symbol;
  final num accountId;
  final int status;
  final String time;
  final int changeType;

  VicFundHisotryModel({
    required this.sysTradeNo,
    required this.imageUrl,
    required this.channel,
    required this.tradeNo,
    required this.cardNo,
    required this.accountId,
    required this.money,
    required this.remark,
    required this.type,
    required this.symbol,
    required this.status,
    required this.time,
    required this.changeType,
  });

  factory VicFundHisotryModel.fromRawJson(String str) => VicFundHisotryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicFundHisotryModel.fromJson(Map<String, dynamic> json) => VicFundHisotryModel(
    imageUrl: json["image_url"] ?? '',
    sysTradeNo: json["sys_trade_no"] ?? '',
    channel: json["channel"] ?? '',
    tradeNo: json["trade_no"] ?? '',
    cardNo: json["card_no"] ?? '',
    accountId: json["account_id"] ?? 0,
    money: stringToNum(json["money"]),
    remark: json["remark"] ?? '',
    type: json["type"] ?? 0,
    symbol: json["symbol"] ?? 0,
    status: json["status"] ?? 0,
    time: json["time"] ?? '',
    changeType: json["change_type"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    'sys_trade_no': sysTradeNo,
    "trade_no": tradeNo,
    "card_no": cardNo,
    "money": money,
    "remark": remark,
    "account_id": accountId,
    "type": type,
    "symbol": symbol,
    "status": status,
    "time": time,
    "changeType": changeType,
    "channel": channel,
  };
}
