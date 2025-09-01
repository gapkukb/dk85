import 'package:dio/dio.dart';

import 'index.dart';
import 'dart:convert';

class User {
  String name;
  int age;
  int sex;

  User({required this.name, required this.age, required this.sex});

  User copyWith({String? name, int? age, int? sex}) => User(name: name ?? this.name, age: age ?? this.age, sex: sex ?? this.sex);

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(name: json["name"], age: json["age"], sex: json["sex"]);

  Map<String, dynamic> toJson() => {"name": name, "age": age, "sex": sex};
}

void main(List<String> args) async {
  final http = Http(BaseOptions(baseUrl: "http://localhost:9000"));
  http.use(NormalizeHttpInterceptor());
  final queryUser = http.get('/user', User.fromJson, const HttpOptions(cancellable: true));
  final user = queryUser();
  queryUser();
  queryUser();
  queryUser();
  queryUser();
  queryUser.abort();
  print(user);
}
