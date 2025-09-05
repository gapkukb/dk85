import 'dart:convert';

class BalanceModelWrapper {
  final num code;
  final num status;
  final String message;
  final BalanceModel data;

  BalanceModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory BalanceModelWrapper.fromRawJson(String str) => BalanceModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BalanceModelWrapper.fromJson(Map<String, dynamic> json) =>
      BalanceModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: BalanceModel.fromJson(json["data"] ?? {}));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data.toJson()};
}

class BalanceModel {
  final num balance;
  final num balanceFrozen;
  final num ponums;

  BalanceModel({required this.balance, required this.balanceFrozen, required this.ponums});

  factory BalanceModel.fromRawJson(String str) => BalanceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(balance: json["balance"] ?? 0, balanceFrozen: json["balance_frozen"] ?? 0, ponums: json["ponums"] ?? 0);

  Map<String, dynamic> toJson() => {"balance": balance, "balance_frozen": balanceFrozen, "ponums": ponums};
}
