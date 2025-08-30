import 'package:json_annotation/json_annotation.dart';
part 'balance.model.g.dart';

@JsonSerializable()
class BalanceModel {
  @JsonKey(name: "balance")
  final double balance;
  @JsonKey(name: "balance_frozen")
  final double balanceFrozen;
  @JsonKey(name: "points")
  final double points;

  BalanceModel({
    required this.balance,
    required this.balanceFrozen,
    required this.points,
  });

  BalanceModel copyWith({
    double? balance,
    double? balanceFrozen,
    double? points,
  }) => BalanceModel(
    balance: balance ?? this.balance,
    balanceFrozen: balanceFrozen ?? this.balanceFrozen,
    points: points ?? this.points,
  );

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceModelToJson(this);
}
