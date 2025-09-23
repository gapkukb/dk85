part of models;

class VicPaymentOrderModel {
  VicPaymentOrderModel({
    required this.channelCardNo,
    required this.channelName,
    required this.code,
    required this.orderSn,
    required this.result,
    required this.sysTradeNo,
    required this.imageUrl,
  });

  final String channelCardNo;
  final String channelName;
  final num code;
  final String orderSn;
  final String result;
  final String sysTradeNo;
  final String imageUrl;
  int? amount;
  int? channelId;
  String? logo;

  factory VicPaymentOrderModel.fromJson(Map<String, dynamic> json) {
    return VicPaymentOrderModel(
      channelCardNo: json["channel_card_no"] ?? "",
      channelName: json["channel_name"] ?? "",
      code: json["code"] ?? 0,
      orderSn: json["order_sn"] ?? "",
      result: json["result"] ?? "",
      sysTradeNo: json["sys_trade_no"] ?? "",
      imageUrl: json["image_url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "channel_card_no": channelCardNo,
    "channel_name": channelName,
    "code": code,
    "order_sn": orderSn,
    "result": result,
    "sys_trade_no": sysTradeNo,
    "image_url": imageUrl,
  };

  @override
  String toString() {
    return "$channelCardNo, $channelName, $code, $orderSn, $result, $sysTradeNo, $imageUrl, ";
  }
}
