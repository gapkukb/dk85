import 'package:meta/meta.dart';
import 'dart:convert';

class GameModelWrapper {
  final int? code;
  final int? status;
  final String? message;
  final GameGroupModel data;

  GameModelWrapper({this.code, this.status, this.message, required this.data});

  factory GameModelWrapper.fromRawJson(String str) => GameModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameModelWrapper.fromJson(Map<String, dynamic> json) =>
      GameModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: GameGroupModel.fromJson(json["data"] ?? {}));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data.toJson()};
}

class GameGroupModel {
  final List<GameModel> fish;
  final List<GameModel> slots;
  final List<GameModel> poker;
  final List<GameModel> mini;

  GameGroupModel({required this.fish, required this.slots, required this.poker, required this.mini});

  factory GameGroupModel.fromRawJson(String str) => GameGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameGroupModel.fromJson(Map<String, dynamic> json) => GameGroupModel(
    fish: List<GameModel>.from((json["FISH"] ?? []).map((x) => GameModel.fromJson(x))),
    slots: List<GameModel>.from((json["SLOTS"] ?? []).map((x) => GameModel.fromJson(x))),
    poker: List<GameModel>.from((json["POKER"] ?? []).map((x) => GameModel.fromJson(x))),
    mini: List<GameModel>.from((json["MINI"] ?? []).map((x) => GameModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "FISH": List<dynamic>.from(fish.map((x) => x.toJson())),
    "SLOTS": List<dynamic>.from(slots.map((x) => x.toJson())),
    "POKER": List<dynamic>.from(poker.map((x) => x.toJson())),
    "MINI": List<dynamic>.from(mini.map((x) => x.toJson())),
  };
}

class GameModel {
  final int id;
  final int platformId;
  final String platform;
  final String name;
  final String style;
  final String img;
  final String img1;
  final String device;
  final String vendor;
  final String code;
  final String language;
  final String currency;
  final int hot;
  final int recommend;
  final int likeNum;
  final int isNew;
  final int status;
  final int sort;
  bool liked;
  final String createdAt;
  final String updatedAt;

  GameModel({
    required this.id,
    required this.platform,
    required this.platformId,
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
    required this.liked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GameModel.fromRawJson(String str) => GameModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    id: json["id"] ?? -1,
    platform: json["platform"] ?? '',
    platformId: json["platform_id"] ?? -1,
    name: json["name"] ?? '',
    style: json["style"] ?? '',
    img: json["img"] ?? '',
    img1: json["img1"] ?? '',
    device: json["device"] ?? '',
    vendor: json["vendor"] ?? '',
    code: json["code"] ?? '',
    language: json["language"] ?? '',
    currency: json["currency"] ?? '',
    hot: json["hot"] ?? 0,
    recommend: json["recommend"] ?? 0,
    likeNum: json["like_num"] ?? 0,
    isNew: json["is_new"] ?? 0,
    status: json["status"] ?? 0,
    sort: json["sort"] ?? 0,
    liked: false,
    createdAt: json["created_at"] ?? '',
    updatedAt: json["updated_at"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "platform": platform,
    "platformId": platformId,
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
    "liked": liked,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class FavoriteModelWrapper {
  final int code;
  final int status;
  final String message;
  final FavoriteModelGroup data;

  FavoriteModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory FavoriteModelWrapper.fromRawJson(String str) => FavoriteModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FavoriteModelWrapper.fromJson(Map<String, dynamic> json) =>
      FavoriteModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: FavoriteModelGroup.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data.toJson()};
}

class FavoriteModelGroup {
  final List<FavoriteModel> list;
  final int count;

  FavoriteModelGroup({required this.list, required this.count});

  factory FavoriteModelGroup.fromRawJson(String str) => FavoriteModelGroup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FavoriteModelGroup.fromJson(Map<String, dynamic> json) =>
      FavoriteModelGroup(list: List<FavoriteModel>.from((json["list"] ?? []).map((x) => FavoriteModel.fromJson(x))), count: json["count"]);

  Map<String, dynamic> toJson() => {"list": List<dynamic>.from(list.map((x) => x.toJson())), "count": count};
}

class FavoriteModel {
  final int id;
  final int siteId;
  final int platformId;
  final int gameId;
  final int userId;
  final String createdAt;
  final String updatedAt;

  FavoriteModel({required this.id, required this.platformId, required this.siteId, required this.gameId, required this.userId, required this.createdAt, required this.updatedAt});

  factory FavoriteModel.fromRawJson(String str) => FavoriteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    id: json["id"] ?? 0,
    platformId: json["platform_id"] ?? 0,
    siteId: json["site_id"] ?? 0,
    gameId: json["game_id"] ?? 0,
    userId: json["user_id"] ?? '',
    createdAt: json["created_at"] ?? '',
    updatedAt: json["updated_at"] ?? '',
  );

  Map<String, dynamic> toJson() => {"id": id, "platform_id": platformId, "site_id": siteId, "game_id": gameId, "user_id": userId, "created_at": createdAt, "updated_at": updatedAt};
}
