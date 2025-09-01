// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
  final int code;
  final int status;
  final String message;
  final Data data;

  Test({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final String channelCardNo;
  final String channelName;
  final int code;
  final String orderSn;
  final String result;
  final String sysTradeNo;
  final String imageUrl;

  Data({
    required this.channelCardNo,
    required this.channelName,
    required this.code,
    required this.orderSn,
    required this.result,
    required this.sysTradeNo,
    required this.imageUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
