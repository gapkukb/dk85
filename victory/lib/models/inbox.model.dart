import 'package:meta/meta.dart';
import 'dart:convert';

class VicInboxGroupModel {
  final List<VicInboxModel> list;
  final int count;
  final int unreadMessageCount;

  VicInboxGroupModel({required this.list, required this.count, required this.unreadMessageCount});

  factory VicInboxGroupModel.fromRawJson(String str) => VicInboxGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicInboxGroupModel.fromJson(Map<String, dynamic> json) => VicInboxGroupModel(
    list: List<VicInboxModel>.from((json["list"] ?? []).map((x) => VicInboxModel.fromJson(x))),
    count: json["count"],
    unreadMessageCount: json["unread_message_count"],
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "count": count,
    "unread_message_count": unreadMessageCount,
  };
}

class VicInboxModel {
  final int id;
  final String title;
  final String content;
  final String createdAt;
  final int status;

  VicInboxModel({required this.id, required this.title, required this.content, required this.createdAt, required this.status});

  factory VicInboxModel.fromRawJson(String str) => VicInboxModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicInboxModel.fromJson(Map<String, dynamic> json) => VicInboxModel(
    id: json["id"] ?? 0,
    title: json["title"] ?? '',
    content: json["content"] ?? '',
    createdAt: json["created_at"] ?? '',
    status: json["status"] ?? -1,
  );

  Map<String, dynamic> toJson() => {"id": id, "title": title, "content": content, "created_at": createdAt, "status": status};
}
