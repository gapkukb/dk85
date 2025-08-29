import 'package:json_annotation/json_annotation.dart';
part 'ad_list.model.g.dart';

@JsonSerializable()
class AdModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "type")
  final int type;
  @JsonKey(name: "before_login")
  final int beforeLogin;
  @JsonKey(name: "position")
  final int position;
  @JsonKey(name: "sort")
  final int sort;

  AdModel({
    required this.name,
    required this.image,
    required this.url,
    required this.type,
    required this.beforeLogin,
    required this.position,
    required this.sort,
  });

  AdModel copyWith({
    String? name,
    String? image,
    String? url,
    int? type,
    int? beforeLogin,
    int? position,
    int? sort,
  }) => AdModel(
    name: name ?? this.name,
    image: image ?? this.image,
    url: url ?? this.url,
    type: type ?? this.type,
    beforeLogin: beforeLogin ?? this.beforeLogin,
    position: position ?? this.position,
    sort: sort ?? this.sort,
  );

  factory AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdModelToJson(this);
}
