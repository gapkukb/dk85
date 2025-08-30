// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
  fish: (json['FISH'] as List<dynamic>)
      .map((e) => Game.fromJson(e as Map<String, dynamic>))
      .toList(),
  slots: (json['SLOTS'] as List<dynamic>)
      .map((e) => Game.fromJson(e as Map<String, dynamic>))
      .toList(),
  poker: (json['POKER'] as List<dynamic>)
      .map((e) => Game.fromJson(e as Map<String, dynamic>))
      .toList(),
  mini: (json['MINI'] as List<dynamic>)
      .map((e) => Game.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
  'FISH': instance.fish,
  'SLOTS': instance.slots,
  'POKER': instance.poker,
  'MINI': instance.mini,
};

Game _$GameFromJson(Map<String, dynamic> json) => Game(
  platform: json['platform'] as String,
  name: json['name'] as String,
  style: json['style'] as String,
  img: json['img'] as String,
  img1: json['img1'] as String,
  device: json['device'] as String,
  vendor: json['vendor'] as String,
  code: json['code'] as String,
  language: json['language'] as String,
  currency: json['currency'] as String,
  hot: (json['hot'] as num).toInt(),
  recommend: (json['recommend'] as num).toInt(),
  likeNum: (json['like_num'] as num).toInt(),
  is_new: (json['new'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
  'platform': instance.platform,
  'name': instance.name,
  'style': instance.style,
  'img': instance.img,
  'img1': instance.img1,
  'device': instance.device,
  'vendor': instance.vendor,
  'code': instance.code,
  'language': instance.language,
  'currency': instance.currency,
  'hot': instance.hot,
  'recommend': instance.recommend,
  'like_num': instance.likeNum,
  'new': instance.is_new,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
