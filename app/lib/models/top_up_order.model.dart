import 'package:meta/meta.dart';
import 'dart:convert';

class TopUpOrderModelWrapper {
  final int code;
  final int status;
  final String message;
  final TopUpOrderModel data;

  TopUpOrderModelWrapper({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory TopUpOrderModelWrapper.fromRawJson(String str) =>
      TopUpOrderModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopUpOrderModelWrapper.fromJson(Map<String, dynamic> json) =>
      TopUpOrderModelWrapper(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: TopUpOrderModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class TopUpOrderModel {
  final String channelCardNo;
  final String channelName;
  final int code;
  final String orderSn;
  final String result;
  final String sysTradeNo;
  final String imageUrl;

  TopUpOrderModel({
    required this.channelCardNo,
    required this.channelName,
    required this.code,
    required this.orderSn,
    required this.result,
    required this.sysTradeNo,
    required this.imageUrl,
  });

  factory TopUpOrderModel.fromRawJson(String str) =>
      TopUpOrderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopUpOrderModel.fromJson(Map<String, dynamic> json) =>
      TopUpOrderModel(
        channelCardNo: json["channel_card_no"],
        channelName: json["channel_name"],
        code: json["code"],
        orderSn: json["order_sn"],
        result: json["result"],
        sysTradeNo: json["sys_trade_no"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
    "channel_card_no": channelCardNo,
    "channel_name": channelName,
    "code": code,
    "order_sn": orderSn,
    "result": result,
    "sys_trade_no": sysTradeNo,
    "image_url": imageUrl,
  };
}
