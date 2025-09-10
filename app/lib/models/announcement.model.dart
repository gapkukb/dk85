import 'package:meta/meta.dart';
import 'dart:convert';

class AnnouncementModelWrapper {
  final int code;
  final int status;
  final String message;
  final List<AnnouncementModel> data;

  AnnouncementModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory AnnouncementModelWrapper.fromRawJson(String str) => AnnouncementModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnnouncementModelWrapper.fromJson(Map<String, dynamic> json) => AnnouncementModelWrapper(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    data: List<AnnouncementModel>.from((json["data"] ?? []).map((x) => AnnouncementModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": List<dynamic>.from(data.map((x) => x.toJson()))};
}

class AnnouncementModel {
  final String title;
  final String url;
  final String content;
  final String createdAt;

  AnnouncementModel({required this.title, required this.url, required this.content, required this.createdAt});

  factory AnnouncementModel.fromRawJson(String str) => AnnouncementModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      AnnouncementModel(title: json["title"] ?? '', url: json["url"] ?? '', content: json["content"] ?? '', createdAt: json["created_at"] ?? '');

  Map<String, dynamic> toJson() => {"title": title, "url": url, "content": content, "created_at": createdAt};
}
