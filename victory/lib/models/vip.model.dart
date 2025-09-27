import 'dart:convert';

import 'package:victory/helper/string_to_num.dart';

class VicVipLevelModel {
  VicVipLevelModel({
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
    required this.dailyWithdrawTimes,
    required this.userCount,
    required this.fieldsDisable,
    required this.autoProviding,
    required this.activities,
  });

  final int id;
  final String name;
  final num depositAmount;
  final num betAmount;
  final num pointsUpgrade;
  final num bonusUpgrade;
  final num bonusBirthday;
  final String rebatePercentSports;
  final String rebatePercentLottery;
  final String rebatePercentLive;
  final String rebatePercentEgame;
  final String rebatePercentPoker;
  final num paymentLimit;
  final num betLimit;
  final num moneyLimit;
  final num paymentLimitMonth;
  final num betLimitMonth;
  final num moneyMonth;
  final num paymentLimitWeek;
  final num betLimitWeek;
  final num moneyWeek;
  final num dailyWithdrawTimes;
  final num userCount;
  final String fieldsDisable;
  final String autoProviding;
  final List<dynamic> activities;

  factory VicVipLevelModel.fromJson(Map<String, dynamic> json) {
    return VicVipLevelModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      depositAmount: json["deposit_amount"] ?? 0,
      betAmount: json["bet_amount"] ?? 0,
      pointsUpgrade: json["points_upgrade"] ?? 0,
      bonusUpgrade: json["bonus_upgrade"] ?? 0,
      bonusBirthday: json["bonus_birthday"] ?? 0,
      rebatePercentSports: json["rebate_percent_sports"] ?? "",
      rebatePercentLottery: json["rebate_percent_lottery"] ?? "",
      rebatePercentLive: json["rebate_percent_live"] ?? "",
      rebatePercentEgame: json["rebate_percent_egame"] ?? "",
      rebatePercentPoker: json["rebate_percent_poker"] ?? "",
      paymentLimit: json["payment_limit"] ?? 0,
      betLimit: json["bet_limit"] ?? 0,
      moneyLimit: json["money_limit"] ?? 0,
      paymentLimitMonth: json["payment_limit_month"] ?? 0,
      betLimitMonth: json["bet_limit_month"] ?? 0,
      moneyMonth: json["money_month"] ?? 0,
      paymentLimitWeek: json["payment_limit_week"] ?? 0,
      betLimitWeek: json["bet_limit_week"] ?? 0,
      moneyWeek: json["money_week"] ?? 0,
      dailyWithdrawTimes: json["daily_withdraw_times"] ?? 0,
      userCount: json["user_count"] ?? 0,
      fieldsDisable: json["fields_disable"] ?? "",
      autoProviding: json["auto_providing"] ?? "",
      activities: json["activities"] == null ? [] : List<dynamic>.from(json["activities"]!.map((x) => x)),
    );
  }

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
    "daily_withdraw_times": dailyWithdrawTimes,
    "user_count": userCount,
    "fields_disable": fieldsDisable,
    "auto_providing": autoProviding,
    "activities": activities.map((x) => x).toList(),
  };

  @override
  String toString() {
    return "$id, $name, $depositAmount, $betAmount, $pointsUpgrade, $bonusUpgrade, $bonusBirthday, $rebatePercentSports, $rebatePercentLottery, $rebatePercentLive, $rebatePercentEgame, $rebatePercentPoker, $paymentLimit, $betLimit, $moneyLimit, $paymentLimitMonth, $betLimitMonth, $moneyMonth, $paymentLimitWeek, $betLimitWeek, $moneyWeek, $dailyWithdrawTimes, $userCount, $fieldsDisable, $autoProviding, $activities, ";
  }
}

class VicVipBounsModel {
  final num gradeId;
  final num totalDepositAmount;
  final num totalBetAmount;
  final bool isAvailable;
  final String isAvailableTxt;

  VicVipBounsModel({
    required this.gradeId,
    required this.totalDepositAmount,
    required this.totalBetAmount,
    required this.isAvailable,
    required this.isAvailableTxt,
  });

  factory VicVipBounsModel.fromRawJson(String str) => VicVipBounsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicVipBounsModel.fromJson(Map<String, dynamic> json) => VicVipBounsModel(
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
