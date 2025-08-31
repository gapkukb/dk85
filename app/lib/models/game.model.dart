import 'package:meta/meta.dart';
import 'dart:convert';

class GameModelWrapper {
  final int code;
  final int status;
  final String message;
  final GameGroupModel data;

  GameModelWrapper({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory GameModelWrapper.fromRawJson(String str) =>
      GameModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameModelWrapper.fromJson(Map<String, dynamic> json) =>
      GameModelWrapper(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: GameGroupModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class GameGroupModel {
  final List<GameModel> fish;
  final List<GameModel> slots;
  final List<GameModel> poker;
  final List<GameModel> mini;

  GameGroupModel({
    required this.fish,
    required this.slots,
    required this.poker,
    required this.mini,
  });

  factory GameGroupModel.fromRawJson(String str) =>
      GameGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameGroupModel.fromJson(Map<String, dynamic> json) => GameGroupModel(
    fish: List<GameModel>.from(
      (json["FISH"] ?? []).map((x) => GameModel.fromJson(x)),
    ),
    slots: List<GameModel>.from(
      (json["SLOTS"] ?? []).map((x) => GameModel.fromJson(x)),
    ),
    poker: List<GameModel>.from(
      (json["POKER"] ?? []).map((x) => GameModel.fromJson(x)),
    ),
    mini: List<GameModel>.from(
      (json["MINI"] ?? []).map((x) => GameModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "FISH": List<dynamic>.from(fish.map((x) => x.toJson())),
    "SLOTS": List<dynamic>.from(slots.map((x) => x.toJson())),
    "POKER": List<dynamic>.from(poker.map((x) => x.toJson())),
    "MINI": List<dynamic>.from(mini.map((x) => x.toJson())),
  };
}

class GameModel {
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
  final String createdAt;
  final String updatedAt;

  GameModel({
    required this.platform,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory GameModel.fromRawJson(String str) =>
      GameModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    platform: json["platform"],
    name: json["name"],
    style: json["style"],
    img: json["img"],
    img1: json["img1"],
    device: json["device"],
    vendor: json["vendor"],
    code: json["code"],
    language: json["language"],
    currency: json["currency"],
    hot: json["hot"],
    recommend: json["recommend"],
    likeNum: json["like_num"],
    isNew: json["new"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "platform": platform,
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
    "new": isNew,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
