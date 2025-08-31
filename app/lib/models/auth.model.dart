import 'package:meta/meta.dart';
import 'dart:convert';

class AuthModelWrapper {
  final int code;
  final int status;
  final String message;
  final AuthModel data;

  AuthModelWrapper({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthModelWrapper.fromRawJson(String str) =>
      AuthModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthModelWrapper.fromJson(Map<String, dynamic> json) =>
      AuthModelWrapper(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: AuthModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class AuthModel {
  final String token;
  final int expiresIn;

  AuthModel({required this.token, required this.expiresIn});

  factory AuthModel.fromRawJson(String str) =>
      AuthModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(token: json["token"], expiresIn: json["expires_in"]);

  Map<String, dynamic> toJson() => {"token": token, "expires_in": expiresIn};
}
