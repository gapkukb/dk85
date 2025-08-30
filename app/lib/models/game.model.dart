import 'package:json_annotation/json_annotation.dart';

part 'game.model.g.dart';

@JsonSerializable()
class GameModel {
  @JsonKey(name: "FISH")
  final List<Game> fish;
  @JsonKey(name: "SLOTS")
  final List<Game> slots;
  @JsonKey(name: "POKER")
  final List<Game> poker;
  @JsonKey(name: "MINI")
  final List<Game> mini;

  GameModel({
    required this.fish,
    required this.slots,
    required this.poker,
    required this.mini,
  });

  GameModel copyWith({
    List<Game>? fish,
    List<Game>? slots,
    List<Game>? poker,
    List<Game>? mini,
  }) => GameModel(
    fish: fish ?? this.fish,
    slots: slots ?? this.slots,
    poker: poker ?? this.poker,
    mini: mini ?? this.mini,
  );

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}

@JsonSerializable()
class Game {
  @JsonKey(name: "platform")
  final String platform;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "style")
  final String style;
  @JsonKey(name: "img")
  final String img;
  @JsonKey(name: "img1")
  final String img1;
  @JsonKey(name: "device")
  final String device;
  @JsonKey(name: "vendor")
  final String vendor;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "language")
  final String language;
  @JsonKey(name: "currency")
  final String currency;
  @JsonKey(name: "hot")
  final int hot;
  @JsonKey(name: "recommend")
  final int recommend;
  @JsonKey(name: "like_num")
  final int likeNum;
  @JsonKey(name: "new")
  final int is_new;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;

  Game({
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
    required this.is_new,
    required this.createdAt,
    required this.updatedAt,
  });

  Game copyWith({
    String? platform,
    String? name,
    String? style,
    String? img,
    String? img1,
    String? device,
    String? vendor,
    String? code,
    String? language,
    String? currency,
    int? hot,
    int? recommend,
    int? likeNum,
    int? fishNew,
    String? createdAt,
    String? updatedAt,
  }) => Game(
    platform: platform ?? this.platform,
    name: name ?? this.name,
    style: style ?? this.style,
    img: img ?? this.img,
    img1: img1 ?? this.img1,
    device: device ?? this.device,
    vendor: vendor ?? this.vendor,
    code: code ?? this.code,
    language: language ?? this.language,
    currency: currency ?? this.currency,
    hot: hot ?? this.hot,
    recommend: recommend ?? this.recommend,
    likeNum: likeNum ?? this.likeNum,
    is_new: fishNew ?? is_new,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
