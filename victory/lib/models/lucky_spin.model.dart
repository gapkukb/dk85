part of 'models.dart';

class LuckySpinModel {
  LuckySpinModel({
    required this.activityName,
    required this.activityId,
    required this.userLimitHours,
    required this.activityCountDownSeconds,
    required this.startTime,
    required this.endTime,
    required this.activityStatus,
    required this.turnoverMultiplier,
    required this.minDepositAmountForPrize,
    required this.maxDepositBaseForPrize,
    required this.siteCode,
    required this.channelConfig,
    required this.lotteryStatus,
    required this.userParticipateInfo,
  });

  final String activityName;
  final int activityId;
  final num userLimitHours;
  final num activityCountDownSeconds;
  final DateTime? startTime;
  final DateTime? endTime;
  final num activityStatus;
  final num turnoverMultiplier;
  final num minDepositAmountForPrize;
  final num maxDepositBaseForPrize;
  final String siteCode;
  final ChannelConfig? channelConfig;
  final num lotteryStatus;
  final UserParticipateInfo? userParticipateInfo;

  factory LuckySpinModel.fromJson(Map<String, dynamic> json) {
    return LuckySpinModel(
      activityName: json["activity_name"] ?? "",
      activityId: json["activity_id"] ?? 0,
      userLimitHours: json["user_limit_hours"] ?? 0,
      activityCountDownSeconds: json["activity_count_down_seconds"] ?? 0,
      startTime: DateTime.tryParse(json["start_time"] ?? ""),
      endTime: DateTime.tryParse(json["end_time"] ?? ""),
      activityStatus: json["activity_status"] ?? 0,
      turnoverMultiplier: json["turnover_multiplier"] ?? 0,
      minDepositAmountForPrize: json["min_deposit_amount_for_prize"] ?? 0,
      maxDepositBaseForPrize: json["max_deposit_base_for_prize"] ?? 0,
      siteCode: json["site_code"] ?? "",
      channelConfig: json["channel_config"] == null ? null : ChannelConfig.fromJson(json["channel_config"]),
      lotteryStatus: json["lottery_status"] ?? 0,
      userParticipateInfo: json["user_participate_info"] == null ? null : UserParticipateInfo.fromJson(json["user_participate_info"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "activity_name": activityName,
    "activity_id": activityId,
    "user_limit_hours": userLimitHours,
    "activity_count_down_seconds": activityCountDownSeconds,
    "start_time": startTime?.toIso8601String(),
    "end_time": endTime?.toIso8601String(),
    "activity_status": activityStatus,
    "turnover_multiplier": turnoverMultiplier,
    "min_deposit_amount_for_prize": minDepositAmountForPrize,
    "max_deposit_base_for_prize": maxDepositBaseForPrize,
    "site_code": siteCode,
    "channel_config": channelConfig?.toJson(),
    "lottery_status": lotteryStatus,
    "user_participate_info": userParticipateInfo?.toJson(),
  };

  @override
  String toString() {
    return "$activityName, $activityId, $userLimitHours, $activityCountDownSeconds, $startTime, $endTime, $activityStatus, $turnoverMultiplier, $minDepositAmountForPrize, $maxDepositBaseForPrize, $siteCode, $channelConfig, $lotteryStatus, $userParticipateInfo, ";
  }
}

class ChannelConfig {
  ChannelConfig({
    required this.channelId,
    required this.channelStatus,
    required this.channelValue,
    required this.channelList,
  });

  final int channelId;
  final num channelStatus;
  final String channelValue;
  final String channelList;

  factory ChannelConfig.fromJson(Map<String, dynamic> json) {
    return ChannelConfig(
      channelId: json["channel_id"] ?? 0,
      channelStatus: json["channel_status"] ?? 0,
      channelValue: json["channel_value"] ?? "",
      channelList: json["channel_list"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "channel_id": channelId,
    "channel_status": channelStatus,
    "channel_value": channelValue,
    "channel_list": channelList,
  };

  @override
  String toString() {
    return "$channelId, $channelStatus, $channelValue, $channelList, ";
  }
}

class UserParticipateInfo {
  UserParticipateInfo({
    required this.participateId,
  });

  final int participateId;

  factory UserParticipateInfo.fromJson(Map<String, dynamic> json) {
    return UserParticipateInfo(
      participateId: json["participate_id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "participate_id": participateId,
  };

  @override
  String toString() {
    return "$participateId, ";
  }
}

class LuckySpinClaimModel {
  LuckySpinClaimModel({
    required this.participateId,
    required this.priceRatio,
    required this.priceAmount,
    required this.depositAmount,
    required this.baseAmount,
  });

  final int participateId;
  final num priceRatio;
  final num priceAmount;
  final num depositAmount;
  final num baseAmount;

  factory LuckySpinClaimModel.fromJson(Map<String, dynamic> json) {
    return LuckySpinClaimModel(
      participateId: json["participate_id"] ?? 0,
      priceRatio: json["price_ratio"] ?? 0,
      priceAmount: json["price_amount"] ?? 0,
      depositAmount: json["deposit_amount"] ?? 0,
      baseAmount: json["base_amount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "participate_id": participateId,
    "price_ratio": priceRatio,
    "price_amount": priceAmount,
    "deposit_amount": depositAmount,
    "base_amount": baseAmount,
  };

  @override
  String toString() {
    return "$participateId, $priceRatio, $priceAmount, $depositAmount, $baseAmount, ";
  }
}
