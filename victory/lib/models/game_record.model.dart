import 'dart:convert';

import 'package:victory/helper/string_to_num.dart';

class VicGameHistoryGroupModel {
  final List<VicGameHistoryModel> list;
  final int count;
  final int orderCount;
  final num validOrderCount;
  final num validBetAmount;
  final num winOrLose;
  final num validBetAmountSettle;
  final num totalAmount;
  final num allGameTotalAmount;

  VicGameHistoryGroupModel({
    required this.list,
    required this.count,
    required this.orderCount,
    required this.validOrderCount,
    required this.validBetAmount,
    required this.winOrLose,
    required this.validBetAmountSettle,
    required this.totalAmount,
    required this.allGameTotalAmount,
  });

  factory VicGameHistoryGroupModel.fromRawJson(String str) => VicGameHistoryGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicGameHistoryGroupModel.fromJson(Map<String, dynamic> json) => VicGameHistoryGroupModel(
    list: List<VicGameHistoryModel>.from((json["list"] ?? []).map((x) => VicGameHistoryModel.fromJson(x))),
    count: json["count"] ?? 0,
    orderCount: json["order_count"] ?? 0,
    validOrderCount: json["valid_order_count"] ?? 0,
    validBetAmount: stringToNum(json["valid_bet_amount"]),
    winOrLose: stringToNum(json["win_or_lose"]),
    validBetAmountSettle: stringToNum(json["valid_bet_amount_settle"]),
    totalAmount: stringToNum(json["total_amount"]),
    allGameTotalAmount: stringToNum(json["all_game_total_amount"]),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "count": count,
    "order_count": orderCount,
    "valid_order_count": validOrderCount,
    "valid_bet_amount": validBetAmount,
    "win_or_lose": winOrLose,
    "valid_bet_amount_settle": validBetAmountSettle,
    "total_amount": totalAmount,
    "all_game_total_amount": allGameTotalAmount,
  };
}

class VicGameHistoryModel {
  final int id;
  final String gameNo;
  final String inningNo;
  final String externalTransactionId;
  final String username;
  final String currencyCode;
  final String gameCode;
  final String vendorCode;
  final String gameCategoryCode;
  final num betAmount;
  final num winAmount;
  final String win;
  final num validAmount;
  final num jackpotAmount;
  final int betStatus;
  final String betTime;
  final num vendorSettleTime;
  final int isFreeSpin;
  final String vendorBetId;
  final String createdAt;
  final String updatedAt;
  final String name;

  VicGameHistoryModel({
    required this.id,
    required this.gameNo,
    required this.inningNo,
    required this.externalTransactionId,
    required this.username,
    required this.currencyCode,
    required this.gameCode,
    required this.vendorCode,
    required this.gameCategoryCode,
    required this.betAmount,
    required this.winAmount,
    required this.win,
    required this.validAmount,
    required this.jackpotAmount,
    required this.betStatus,
    required this.betTime,
    required this.vendorSettleTime,
    required this.isFreeSpin,
    required this.vendorBetId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory VicGameHistoryModel.fromRawJson(String str) => VicGameHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicGameHistoryModel.fromJson(Map<String, dynamic> json) => VicGameHistoryModel(
    id: json["id"] ?? 0,
    gameNo: json["game_no"] ?? '',
    inningNo: json["inning_no"] ?? '',
    externalTransactionId: json["externalTransactionId"] ?? '',
    username: json["username"] ?? '',
    currencyCode: json["currencyCode"] ?? '',
    gameCode: json["gameCode"] ?? '',
    vendorCode: json["vendorCode"] ?? '',
    gameCategoryCode: json["gameCategoryCode"] ?? '',
    betAmount: stringToNum(json["bet_amount"]),
    winAmount: stringToNum(json["winAmount"]),
    win: json["win"] ?? '',
    validAmount: stringToNum(json["valid_amount"]),
    jackpotAmount: stringToNum(json["jackpotAmount"]),
    betStatus: json["bet_status"] ?? 0,
    betTime: json["bet_time"] ?? '',
    vendorSettleTime: json["vendorSettleTime"] ?? DateTime.now().millisecondsSinceEpoch,
    isFreeSpin: json["isFreeSpin"] ?? 0,
    vendorBetId: json["vendorBetId"] ?? '',
    createdAt: json["created_at"] ?? '',
    updatedAt: json["updated_at"] ?? '',
    name: json["name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "game_no": gameNo,
    "inning_no": inningNo,
    "externalTransactionId": externalTransactionId,
    "username": username,
    "currencyCode": currencyCode,
    "gameCode": gameCode,
    "vendorCode": vendorCode,
    "gameCategoryCode": gameCategoryCode,
    "bet_amount": betAmount,
    "winAmount": winAmount,
    "win": win,
    "valid_amount": validAmount,
    "jackpotAmount": jackpotAmount,
    "bet_status": betStatus,
    "bet_time": betTime,
    "vendorSettleTime": vendorSettleTime,
    "isFreeSpin": isFreeSpin,
    "vendorBetId": vendorBetId,
    "created_at": createdAt,
  };
}
