// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_list.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdModel _$AdModelFromJson(Map<String, dynamic> json) => AdModel(
  name: json['name'] as String,
  image: json['image'] as String,
  url: json['url'] as String,
  type: (json['type'] as num).toInt(),
  beforeLogin: (json['before_login'] as num).toInt(),
  position: (json['position'] as num).toInt(),
  sort: (json['sort'] as num).toInt(),
);

Map<String, dynamic> _$AdModelToJson(AdModel instance) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
  'url': instance.url,
  'type': instance.type,
  'before_login': instance.beforeLogin,
  'position': instance.position,
  'sort': instance.sort,
};
