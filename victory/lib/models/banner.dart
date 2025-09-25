part of models;

class VicBannerModel extends VicBaseModel {
  const VicBannerModel({
    required this.id,
    required this.name,
    required this.image,
    required this.url,
    required this.type,
    required this.beforeLogin,
    required this.position,
    required this.sort,
  });

  final int id;
  final String name;
  final String image;
  final String url;
  final num type;
  final num beforeLogin;
  final num position;
  final num sort;

  factory VicBannerModel.fromJson(Map<String, dynamic> json) {
    return VicBannerModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      url: json["url"] ?? "",
      type: json["type"] ?? 0,
      beforeLogin: json["before_login"] ?? 0,
      position: json["position"] ?? 0,
      sort: json["sort"] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "url": url,
    "type": type,
    "before_login": beforeLogin,
    "position": position,
    "sort": sort,
  };

  @override
  String toString() {
    return "$id, $name, $image, $url, $type, $beforeLogin, $position, $sort, ";
  }
}
