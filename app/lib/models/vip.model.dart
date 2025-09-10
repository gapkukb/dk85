import 'package:app/helper/string_to_num.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class VipModelWrapper {
  final int code;
  final int status;
  final String message;
  final List<VipModel> data;

  VipModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory VipModelWrapper.fromRawJson(String str) => VipModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VipModelWrapper.fromJson(Map<String, dynamic> json) =>
      VipModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: List<VipModel>.from((json["data"] ?? []).map((x) => VipModel.fromJson(x))));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": List<dynamic>.from(data.map((x) => x.toJson()))};
}

class VipModel {
  final int id;
  final String name;
  final num depositAmount;
  final num betAmount;
  final num pointsUpgrade;
  final num bonusUpgrade;
  final num bonusBirthday;
  final num rebatePercentSports;
  final num rebatePercentLottery;
  final num rebatePercentLive;
  final num rebatePercentEgame;
  final num rebatePercentPoker;
  final num paymentLimit;
  final num betLimit;
  final num moneyLimit;
  final num paymentLimitMonth;
  final num betLimitMonth;
  final num moneyMonth;
  final num paymentLimitWeek;
  final num betLimitWeek;
  final num moneyWeek;
  final num userCount;
  final String fieldsDisable;
  final String autoProviding;
  final List<dynamic> activities;

  VipModel({
    required this.id,
    required this.name,
    required this.depositAmount,
    required this.betAmount,
    required this.pointsUpgrade,
    required this.bonusUpgrade,
    required this.bonusBirthday,
    required this.rebatePercentSports,
    required this.rebatePercentLottery,
    required this.rebatePercentLive,
    required this.rebatePercentEgame,
    required this.rebatePercentPoker,
    required this.paymentLimit,
    required this.betLimit,
    required this.moneyLimit,
    required this.paymentLimitMonth,
    required this.betLimitMonth,
    required this.moneyMonth,
    required this.paymentLimitWeek,
    required this.betLimitWeek,
    required this.moneyWeek,
    required this.userCount,
    required this.fieldsDisable,
    required this.autoProviding,
    required this.activities,
  });

  factory VipModel.fromRawJson(String str) => VipModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VipModel.fromJson(Map<String, dynamic> json) => VipModel(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    depositAmount: stringToNum(json["deposit_amount"]),
    betAmount: stringToNum(json["bet_amount"]),
    pointsUpgrade: stringToNum(json["points_upgrade"]),
    bonusUpgrade: stringToNum(json["bonus_upgrade"]),
    bonusBirthday: stringToNum(json["bonus_birthday"]),
    rebatePercentSports: stringToNum(json["rebate_percent_sports"]),
    rebatePercentLottery: stringToNum(json["rebate_percent_lottery"]),
    rebatePercentLive: stringToNum(json["rebate_percent_live"]),
    rebatePercentEgame: stringToNum(json["rebate_percent_egame"]),
    rebatePercentPoker: stringToNum(json["rebate_percent_poker"]),
    paymentLimit: stringToNum(json["payment_limit"]),
    betLimit: stringToNum(json["bet_limit"]),
    moneyLimit: stringToNum(json["money_limit"]),
    paymentLimitMonth: stringToNum(json["payment_limit_month"]),
    betLimitMonth: stringToNum(json["bet_limit_month"]),
    moneyMonth: stringToNum(json["money_month"]),
    paymentLimitWeek: stringToNum(json["payment_limit_week"]),
    betLimitWeek: stringToNum(json["bet_limit_week"]),
    moneyWeek: stringToNum(json["money_week"]),
    userCount: stringToNum(json["user_count"]),
    fieldsDisable: json["fields_disable"] ?? '',
    autoProviding: json["auto_providing"] ?? '',
    activities: List<dynamic>.from((json["activities"] ?? []).map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "deposit_amount": depositAmount,
    "bet_amount": betAmount,
    "points_upgrade": pointsUpgrade,
    "bonus_upgrade": bonusUpgrade,
    "bonus_birthday": bonusBirthday,
    "rebate_percent_sports": rebatePercentSports,
    "rebate_percent_lottery": rebatePercentLottery,
    "rebate_percent_live": rebatePercentLive,
    "rebate_percent_egame": rebatePercentEgame,
    "rebate_percent_poker": rebatePercentPoker,
    "payment_limit": paymentLimit,
    "bet_limit": betLimit,
    "money_limit": moneyLimit,
    "payment_limit_month": paymentLimitMonth,
    "bet_limit_month": betLimitMonth,
    "money_month": moneyMonth,
    "payment_limit_week": paymentLimitWeek,
    "bet_limit_week": betLimitWeek,
    "money_week": moneyWeek,
    "user_count": userCount,
    "fields_disable": fieldsDisable,
    "auto_providing": autoProviding,
    "activities": List<dynamic>.from(activities.map((x) => x)),
  };
}

class VipBounsWrapper {
  final int code;
  final int status;
  final String message;
  final VipBouns data;

  VipBounsWrapper({required this.code, required this.status, required this.message, required this.data});

  factory VipBounsWrapper.fromRawJson(String str) => VipBounsWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VipBounsWrapper.fromJson(Map<String, dynamic> json) =>
      VipBounsWrapper(code: json["code"], status: json["status"], message: json["message"], data: VipBouns.fromJson(json["data"] ?? {}));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data.toJson()};
}

class VipBouns {
  final num gradeId;
  final num totalDepositAmount;
  final num totalBetAmount;
  final bool isAvailable;
  final String isAvailableTxt;

  VipBouns({required this.gradeId, required this.totalDepositAmount, required this.totalBetAmount, required this.isAvailable, required this.isAvailableTxt});

  factory VipBouns.fromRawJson(String str) => VipBouns.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VipBouns.fromJson(Map<String, dynamic> json) => VipBouns(
    gradeId: json["grade_id"] ?? 0,
    totalDepositAmount: stringToNum(json["totalDepositAmount"]),
    totalBetAmount: stringToNum(json["totalBetAmount"]),
    isAvailable: json["is_available"] ?? false,
    isAvailableTxt: json["is_available_txt"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "grade_id": gradeId,
    "totalDepositAmount": totalDepositAmount,
    "totalBetAmount": totalBetAmount,
    "is_available": isAvailable,
    "is_available_txt": isAvailableTxt,
  };
}

class VipUpgradeBounsWrapper {
  final int code;
  final int status;
  final String message;
  final List<VipBouns> data;

  VipUpgradeBounsWrapper({required this.code, required this.status, required this.message, required this.data});

  factory VipUpgradeBounsWrapper.fromRawJson(String str) => VipUpgradeBounsWrapper.fromJson(json.decode(str));

  factory VipUpgradeBounsWrapper.fromJson(Map<String, dynamic> json) =>
      VipUpgradeBounsWrapper(code: json["code"], status: json["status"], message: json["message"], data: List.from((json["data"] ?? []).map((i) => VipBouns.fromJson(i))));
}
