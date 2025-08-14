import 'package:json_annotation/json_annotation.dart';

part 'check_in.g.dart';

@JsonSerializable()
class ModelCheckIn {
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "amount")
  final int amount;

  ModelCheckIn({required this.date, required this.status, required this.amount});

  ModelCheckIn copyWith({String? date, int? status, int? amount}) => ModelCheckIn(date: date ?? this.date, status: status ?? this.status, amount: amount ?? this.amount);

  factory ModelCheckIn.fromJson(Map<String, dynamic> json) => _$ModelCheckInFromJson(json);

  Map<String, dynamic> toJson() => _$ModelCheckInToJson(this);
}
