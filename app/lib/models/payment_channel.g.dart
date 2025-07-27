// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentChannel _$PaymentChannelFromJson(Map<String, dynamic> json) =>
    PaymentChannel(
      sitePayMethodId: (json['sitePayMethodId'] as num).toInt(),
      showName: json['showName'] as String,
      showIcon: json['showIcon'] as String,
      minAmount: (json['minAmount'] as num).toInt(),
      maxAmount: (json['maxAmount'] as num).toInt(),
      isFixAmount: json['isFixAmount'] as bool,
      isSelected: json['isSelected'] as bool,
      fixAmountList: (json['fixAmountList'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      operateRemark: json['operateRemark'] as String,
      action: (json['action'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentChannelToJson(PaymentChannel instance) =>
    <String, dynamic>{
      'sitePayMethodId': instance.sitePayMethodId,
      'showName': instance.showName,
      'showIcon': instance.showIcon,
      'minAmount': instance.minAmount,
      'maxAmount': instance.maxAmount,
      'isFixAmount': instance.isFixAmount,
      'isSelected': instance.isSelected,
      'fixAmountList': instance.fixAmountList,
      'operateRemark': instance.operateRemark,
      'action': instance.action,
    };
