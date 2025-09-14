import 'dart:convert';

class AdModelWrapper {
  final num code;
  final num status;
  final String message;
  final List<AdModel> data;

  AdModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory AdModelWrapper.fromRawJson(String str) => AdModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdModelWrapper.fromJson(Map<String, dynamic> json) =>
      AdModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: List<AdModel>.from((json["data"] ?? []).map((x) => AdModel.fromJson(x))));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": List<dynamic>.from(data.map((x) => x.toJson()))};
}

class AdModel {
  final int id;
  final String name;
  final String image;
  final String url;
  final num type;
  final num beforeLogin;
  final num position;
  final num sort;

  AdModel({
    required this.id,
    required this.name,
    required this.image,
    required this.url,
    required this.type,
    required this.beforeLogin,
    required this.position,
    required this.sort,
  });

  factory AdModel.fromRawJson(String str) => AdModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdModel.fromJson(Map<String, dynamic> json) => AdModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    url: json["url"],
    type: json["type"],
    beforeLogin: json["before_login"],
    position: json["position"],
    sort: json["sort"],
  );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "image": image, "url": url, "type": type, "before_login": beforeLogin, "position": position, "sort": sort};
}
