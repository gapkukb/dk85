import 'package:meta/meta.dart';
import 'dart:convert';

class InboxModelWrapper {
  final int code;
  final int status;
  final String message;
  final InboxModelGroup data;

  InboxModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory InboxModelWrapper.fromRawJson(String str) => InboxModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InboxModelWrapper.fromJson(Map<String, dynamic> json) =>
      InboxModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: InboxModelGroup.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data.toJson()};
}

class InboxModelGroup {
  final List<InboxModel> list;
  final int count;
  final int unreadMessageCount;

  InboxModelGroup({required this.list, required this.count, required this.unreadMessageCount});

  factory InboxModelGroup.fromRawJson(String str) => InboxModelGroup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InboxModelGroup.fromJson(Map<String, dynamic> json) =>
      InboxModelGroup(list: List<InboxModel>.from((json["list"] ?? []).map((x) => InboxModel.fromJson(x))), count: json["count"], unreadMessageCount: json["unread_message_count"]);

  Map<String, dynamic> toJson() => {"list": List<dynamic>.from(list.map((x) => x.toJson())), "count": count, "unread_message_count": unreadMessageCount};
}

class InboxModel {
  final int id;
  final String title;
  final String content;
  final String createdAt;
  final int status;

  InboxModel({required this.id, required this.title, required this.content, required this.createdAt, required this.status});

  factory InboxModel.fromRawJson(String str) => InboxModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InboxModel.fromJson(Map<String, dynamic> json) =>
      InboxModel(id: json["id"] ?? 0, title: json["title"] ?? '', content: json["content"] ?? '', createdAt: json["created_at"] ?? '', status: json["status"] ?? -1);

  Map<String, dynamic> toJson() => {"id": id, "title": title, "content": content, "created_at": createdAt, "status": status};
}
