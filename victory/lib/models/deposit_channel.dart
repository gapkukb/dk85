part of models;

class VicDepositChannelsModel extends VicBaseModel {
  VicDepositChannelsModel({
    required this.activityList,
    required this.accountList,
  });

  final List<VicDepositChannelModel> activityList;
  final List<VicDepositChannelModel> accountList;

  factory VicDepositChannelsModel.fromJson(Map<String, dynamic> json) {
    return VicDepositChannelsModel(
      activityList: json["account_list"] == null
          ? []
          : List<VicDepositChannelModel>.from(json["account_list"]!.map((x) => VicDepositChannelModel.fromJson(x))),
      accountList: json["account_list"] == null
          ? []
          : List<VicDepositChannelModel>.from(json["account_list"]!.map((x) => VicDepositChannelModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "activity_list": activityList.map((x) => x).toList(),
    "account_list": accountList.map((x) => x.toJson()).toList(),
  };

  @override
  String toString() {
    return "$activityList, $accountList, ";
  }
}

class VicDepositChannelModel {
  VicDepositChannelModel({
    required this.id,
    required this.name,
    required this.isInput,
    required this.remark,
    required this.logo,
    required this.gateway,
    required this.eachMin,
    required this.eachMax,
    required this.domain,
    required this.isSelectBank,
    required this.isDecimal,
    required this.isInt,
    required this.moneyList,
    required this.sort,
    required this.key,
  });

  final int id;
  final String name;
  final num isInput;
  final String remark;
  final String logo;
  final num gateway;
  final num eachMin;
  final num eachMax;
  final String domain;
  final num isSelectBank;
  final num isDecimal;
  final num isInt;
  final List<String> moneyList;
  final num sort;
  final String key;

  factory VicDepositChannelModel.fromJson(Map<String, dynamic> json) {
    return VicDepositChannelModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      isInput: json["is_input"] ?? 0,
      remark: json["remark"] ?? "",
      logo: json["logo"] ?? "",
      gateway: json["gateway"] ?? 0,
      eachMin: json["each_min"] ?? 0,
      eachMax: json["each_max"] ?? 0,
      domain: json["domain"] ?? "",
      isSelectBank: json["is_select_bank"] ?? 0,
      isDecimal: json["is_decimal"] ?? 0,
      isInt: json["is_int"] ?? 0,
      moneyList: json["moneyList"] == null ? [] : List<String>.from(json["moneyList"]!.map((x) => x)),
      sort: json["sort"] ?? 0,
      key: json["key"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_input": isInput,
    "remark": remark,
    "logo": logo,
    "gateway": gateway,
    "each_min": eachMin,
    "each_max": eachMax,
    "domain": domain,
    "is_select_bank": isSelectBank,
    "is_decimal": isDecimal,
    "is_int": isInt,
    "moneyList": moneyList.map((x) => x).toList(),
    "sort": sort,
    "key": key,
  };

  @override
  String toString() {
    return "$id, $name, $isInput, $remark, $logo, $gateway, $eachMin, $eachMax, $domain, $isSelectBank, $isDecimal, $isInt, $moneyList, $sort, $key, ";
  }
}
