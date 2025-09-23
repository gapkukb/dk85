part of models;

class VicGamesModel extends VicBaseModel {
  VicGamesModel({
    required this.fish,
    required this.slots,
    required this.poker,
    required this.mini,
  });

  final List<Game> fish;
  final List<Game> slots;
  final List<Game> poker;
  final List<Game> mini;

  factory VicGamesModel.fromJson(Map<String, dynamic> json) {
    return VicGamesModel(
      fish: json["FISH"] == null ? [] : List<Game>.from(json["FISH"]!.map((x) => Game.fromJson(x))),
      slots: json["SLOTS"] == null ? [] : List<Game>.from(json["SLOTS"]!.map((x) => Game.fromJson(x))),
      poker: json["POKER"] == null ? [] : List<Game>.from(json["POKER"]!.map((x) => Game.fromJson(x))),
      mini: json["MINI"] == null ? [] : List<Game>.from(json["MINI"]!.map((x) => Game.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "FISH": fish.map((x) => x.toJson()).toList(),
    "SLOTS": slots.map((x) => x.toJson()).toList(),
    "POKER": poker.map((x) => x.toJson()).toList(),
    "MINI": mini.map((x) => x.toJson()).toList(),
  };

  @override
  String toString() {
    return "$fish, $slots, $poker, $mini, ";
  }
}

class Game {
  Game({
    required this.id,
    required this.platform,
    required this.aliasName,
    required this.name,
    required this.style,
    required this.img,
    required this.img1,
    required this.device,
    required this.vendor,
    required this.code,
    required this.language,
    required this.currency,
    required this.hot,
    required this.recommend,
    required this.likeNum,
    required this.isNew,
    required this.status,
    required this.sort,
    required this.createdAt,
    required this.updatedAt,
    required this.platformId,
    this.liked = false,
  });

  final int id;
  final String platform;
  final dynamic aliasName;
  final String name;
  final String style;
  final String img;
  final String img1;
  final String device;
  final String vendor;
  final String code;
  final String language;
  final String currency;
  final bool hot;
  final bool recommend;
  final num likeNum;
  final bool isNew;
  final bool status;
  final int sort;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int platformId;
  bool liked;

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json["id"] ?? 0,
      platform: json["platform"] ?? "",
      aliasName: json["alias_name"],
      name: json["name"] ?? "",
      style: json["style"] ?? "",
      img: json["img"] ?? "",
      img1: json["img1"] ?? "",
      device: json["device"] ?? "",
      vendor: json["vendor"] ?? "",
      code: json["code"] ?? "",
      language: json["language"] ?? "",
      currency: json["currency"] ?? "",
      hot: json["hot"] ?? false,
      recommend: json["recommend"] ?? false,
      likeNum: json["like_num"] ?? 0,
      isNew: json["is_new"] ?? false,
      status: json["status"] ?? false,
      sort: json["sort"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      platformId: json["platform_id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "platform": platform,
    "alias_name": aliasName,
    "name": name,
    "style": style,
    "img": img,
    "img1": img1,
    "device": device,
    "vendor": vendor,
    "code": code,
    "language": language,
    "currency": currency,
    "hot": hot,
    "recommend": recommend,
    "like_num": likeNum,
    "is_new": isNew,
    "status": status,
    "sort": sort,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "platform_id": platformId,
  };

  @override
  String toString() {
    return "$id, $platform, $aliasName, $name, $style, $img, $img1, $device, $vendor, $code, $language, $currency, $hot, $recommend, $likeNum, $isNew, $status, $sort, $createdAt, $updatedAt, $platformId, ";
  }
}
