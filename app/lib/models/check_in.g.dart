// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelCheckIn _$ModelCheckInFromJson(Map<String, dynamic> json) => ModelCheckIn(
  date: json['date'] as String,
  status: (json['status'] as num).toInt(),
  amount: (json['amount'] as num).toInt(),
);

Map<String, dynamic> _$ModelCheckInToJson(ModelCheckIn instance) =>
    <String, dynamic>{
      'date': instance.date,
      'status': instance.status,
      'amount': instance.amount,
    };
