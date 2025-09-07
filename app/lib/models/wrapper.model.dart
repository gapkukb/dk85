import 'dart:convert';

class ModelWrapper {
  final int? code;
  final int? status;
  final String? message;
  final Map<String, dynamic> data;

  ModelWrapper({this.code, this.status, this.message, required this.data});

  factory ModelWrapper.fromRawJson(String str) => ModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelWrapper.fromJson(Map<String, dynamic> json) => ModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: json["data"] ?? {});

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data};
}
