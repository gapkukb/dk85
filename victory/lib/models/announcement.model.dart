import 'dart:convert';

class VicAnnouncementModel {
  final String title;
  final String url;
  final String content;
  final String createdAt;

  VicAnnouncementModel({required this.title, required this.url, required this.content, required this.createdAt});

  factory VicAnnouncementModel.fromRawJson(String str) => VicAnnouncementModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicAnnouncementModel.fromJson(Map<String, dynamic> json) =>
      VicAnnouncementModel(title: json["title"] ?? '', url: json["url"] ?? '', content: json["content"] ?? '', createdAt: json["created_at"] ?? '');

  Map<String, dynamic> toJson() => {"title": title, "url": url, "content": content, "created_at": createdAt};
}
