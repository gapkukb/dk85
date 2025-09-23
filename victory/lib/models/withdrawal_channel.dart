part of models;

class VicWithdrawalChannelModel extends VicBaseModel {
  VicWithdrawalChannelModel({
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
    required this.isInt,
    required this.moneyList,
    required this.isInput,
    required this.remark,
    required this.logo,
  });

  final int id;
  final int withdrawId;
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
  final num isInt;
  final String moneyList;
  final num isInput;
  final String remark;
  final String logo;

  factory VicWithdrawalChannelModel.fromJson(Map<String, dynamic> json) {
    return VicWithdrawalChannelModel(
      id: json["id"] ?? 0,
      withdrawId: json["withdraw_id"] ?? 0,
      gateway: json["gateway"] ?? 0,
      name: json["name"] ?? "",
      eachMin: json["each_min"] ?? 0,
      eachMax: json["each_max"] ?? 0,
      dailyMax: json["daily_max"] ?? 0,
      todayCount: json["today_count"] ?? 0,
      todayAmount: json["today_amount"] ?? 0,
      status: json["status"] ?? 0,
      sort: json["sort"] ?? 0,
      isDecimal: json["is_decimal"] ?? 0,
      isInt: json["is_int"] ?? 0,
      moneyList: json["moneyList"] ?? "",
      isInput: json["is_input"] ?? 0,
      remark: json["remark"] ?? "",
      logo: json["logo"] ?? "",
    );
  }

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
    "is_int": isInt,
    "moneyList": moneyList,
    "is_input": isInput,
    "remark": remark,
    "logo": logo,
  };

  @override
  String toString() {
    return "$id, $withdrawId, $gateway, $name, $eachMin, $eachMax, $dailyMax, $todayCount, $todayAmount, $status, $sort, $isDecimal, $isInt, $moneyList, $isInput, $remark, $logo, ";
  }
}
