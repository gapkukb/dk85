import 'package:json_annotation/json_annotation.dart';
part 'payment_channel.g.dart';

@JsonSerializable()
class PaymentChannel {
  @JsonKey(name: "sitePayMethodId")
  final int sitePayMethodId;
  @JsonKey(name: "showName")
  final String showName;
  @JsonKey(name: "showIcon")
  final String showIcon;
  @JsonKey(name: "minAmount")
  final int minAmount;
  @JsonKey(name: "maxAmount")
  final int maxAmount;
  @JsonKey(name: "isFixAmount")
  final bool isFixAmount;
  @JsonKey(name: "isSelected")
  final bool isSelected;
  @JsonKey(name: "fixAmountList")
  final List<int> fixAmountList;
  @JsonKey(name: "operateRemark")
  final String operateRemark;
  @JsonKey(name: "action")
  final int action;

  PaymentChannel({
    required this.sitePayMethodId,
    required this.showName,
    required this.showIcon,
    required this.minAmount,
    required this.maxAmount,
    required this.isFixAmount,
    required this.isSelected,
    required this.fixAmountList,
    required this.operateRemark,
    required this.action,
  });

  PaymentChannel copyWith({
    int? sitePayMethodId,
    String? showName,
    String? showIcon,
    int? minAmount,
    int? maxAmount,
    bool? isFixAmount,
    bool? isSelected,
    List<int>? fixAmountList,
    String? operateRemark,
    int? action,
  }) => PaymentChannel(
    sitePayMethodId: sitePayMethodId ?? this.sitePayMethodId,
    showName: showName ?? this.showName,
    showIcon: showIcon ?? this.showIcon,
    minAmount: minAmount ?? this.minAmount,
    maxAmount: maxAmount ?? this.maxAmount,
    isFixAmount: isFixAmount ?? this.isFixAmount,
    isSelected: isSelected ?? this.isSelected,
    fixAmountList: fixAmountList ?? this.fixAmountList,
    operateRemark: operateRemark ?? this.operateRemark,
    action: action ?? this.action,
  );

  factory PaymentChannel.fromJson(Map<String, dynamic> json) =>
      _$PaymentChannelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentChannelToJson(this);
}
