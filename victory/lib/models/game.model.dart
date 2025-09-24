part of models;

class VicGamesModel extends VicBaseModel {
  VicGamesModel({
    required this.fish,
    required this.slots,
    required this.poker,
    required this.mini,
  });

  final List<VicGameModel> fish;
  final List<VicGameModel> slots;
  final List<VicGameModel> poker;
  final List<VicGameModel> mini;

  factory VicGamesModel.fromJson(Map<String, dynamic> json) {
    return VicGamesModel(
      fish: json["FISH"] == null ? [] : List<VicGameModel>.from(json["FISH"]!.map((x) => VicGameModel.fromJson(x))),
      slots: json["SLOTS"] == null ? [] : List<VicGameModel>.from(json["SLOTS"]!.map((x) => VicGameModel.fromJson(x))),
      poker: json["POKER"] == null ? [] : List<VicGameModel>.from(json["POKER"]!.map((x) => VicGameModel.fromJson(x))),
      mini: json["MINI"] == null ? [] : List<VicGameModel>.from(json["MINI"]!.map((x) => VicGameModel.fromJson(x))),
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

class VicGameModel {
  VicGameModel({
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

  factory VicGameModel.fromJson(Map<String, dynamic> json) {
    return VicGameModel(
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

class VicFavsModel {
  final List<VicFavModel> list;
  final int count;

  VicFavsModel({required this.list, required this.count});

  factory VicFavsModel.fromRawJson(String str) => VicFavsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicFavsModel.fromJson(Map<String, dynamic> json) =>
      VicFavsModel(list: List<VicFavModel>.from((json["list"] ?? []).map((x) => VicFavModel.fromJson(x))), count: json["count"]);

  Map<String, dynamic> toJson() => {"list": List<dynamic>.from(list.map((x) => x.toJson())), "count": count};
}

class VicFavModel {
  final int id;
  final int siteId;
  final int platformId;
  final int gameId;
  final int userId;
  final String createdAt;
  final String updatedAt;

  VicFavModel({
    required this.id,
    required this.platformId,
    required this.siteId,
    required this.gameId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VicFavModel.fromRawJson(String str) => VicFavModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VicFavModel.fromJson(Map<String, dynamic> json) => VicFavModel(
    id: json["id"] ?? 0,
    platformId: json["platform_id"] ?? 0,
    siteId: json["site_id"] ?? 0,
    gameId: json["game_id"] ?? 0,
    userId: json["user_id"] ?? '',
    createdAt: json["created_at"] ?? '',
    updatedAt: json["updated_at"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "platform_id": platformId,
    "site_id": siteId,
    "game_id": gameId,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
