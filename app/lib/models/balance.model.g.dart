// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) => BalanceModel(
  balance: (json['balance'] as num).toDouble(),
  balanceFrozen: (json['balance_frozen'] as num).toDouble(),
  points: (json['points'] as num).toDouble(),
);

Map<String, dynamic> _$BalanceModelToJson(BalanceModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'balance_frozen': instance.balanceFrozen,
      'points': instance.points,
    };
