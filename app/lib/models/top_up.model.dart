import 'package:meta/meta.dart';
import 'dart:convert';

class TopUpModelWrapper {
  final num code;
  final num status;
  final String message;
  final TopUpGroupModel data;

  TopUpModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory TopUpModelWrapper.fromRawJson(String str) => TopUpModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopUpModelWrapper.fromJson(Map<String, dynamic> json) => TopUpModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: TopUpGroupModel.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data.toJson()};
}

class TopUpGroupModel {
  final The2 the2;

  TopUpGroupModel({required this.the2});

  factory TopUpGroupModel.fromRawJson(String str) => TopUpGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopUpGroupModel.fromJson(Map<String, dynamic> json) => TopUpGroupModel(the2: The2.fromJson(json["2"]));

  Map<String, dynamic> toJson() => {"2": the2.toJson()};
}

class The2 {
  final List<dynamic> activityList;
  final List<TopUpModel> accountList;

  The2({required this.activityList, required this.accountList});

  factory The2.fromRawJson(String str) => The2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The2.fromJson(Map<String, dynamic> json) =>
      The2(activityList: List<dynamic>.from((json["activity_list"] ?? []).map((x) => x)), accountList: List<TopUpModel>.from((json["account_list"] ?? []).map((x) => TopUpModel.fromJson(x))));

  Map<String, dynamic> toJson() => {"activity_list": List<dynamic>.from((activityList).map((x) => x)), "account_list": List<dynamic>.from(accountList.map((x) => x.toJson()))};
}

class TopUpModel {
  final num id;
  final String name;
  final num isInput;
  final String remark;
  final String logo;
  final num gateway;
  final String eachMin;
  final String eachMax;
  final String domain;
  final num isSelectBank;
  final num isDecimal;
  final num isnum;
  final List<String> moneyList;
  final num sort;
  final String key;

  TopUpModel({
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
    required this.isnum,
    required this.moneyList,
    required this.sort,
    required this.key,
  });

  factory TopUpModel.fromRawJson(String str) => TopUpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopUpModel.fromJson(Map<String, dynamic> json) => TopUpModel(
    id: json["id"],
    name: json["name"],
    isInput: json["is_input"],
    remark: json["remark"],
    logo: json["logo"],
    gateway: json["gateway"],
    eachMin: json["each_min"],
    eachMax: json["each_max"],
    domain: json["domain"],
    isSelectBank: json["is_select_bank"],
    isDecimal: json["is_decimal"],
    isnum: json["is_num"],
    moneyList: List<String>.from(json["moneyList"].map((x) => x)),
    sort: json["sort"],
    key: json["key"],
  );

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
    "is_num": isnum,
    "moneyList": List<dynamic>.from(moneyList.map((x) => x)),
    "sort": sort,
    "key": key,
  };
}
