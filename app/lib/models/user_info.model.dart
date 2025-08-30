import 'package:json_annotation/json_annotation.dart';
part 'user_info.model.g.dart';

@JsonSerializable()
class UserInfoModel {
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "realname")
  final String realname;
  @JsonKey(name: "email")
  final dynamic email;
  @JsonKey(name: "mobile")
  final String mobile;
  @JsonKey(name: "qq")
  final dynamic qq;
  @JsonKey(name: "sex")
  final int sex;
  @JsonKey(name: "birthday")
  final DateTime birthday;
  @JsonKey(name: "last_login_time")
  final String lastLoginTime;
  @JsonKey(name: "last_login_address")
  final String lastLoginAddress;
  @JsonKey(name: "show_beginner_guide")
  final int showBeginnerGuide;
  @JsonKey(name: "gpwd")
  final String gpwd;
  @JsonKey(name: "balance")
  final String balance;
  @JsonKey(name: "balance_frozen")
  final String balanceFrozen;
  @JsonKey(name: "points")
  final int points;
  @JsonKey(name: "grade_id")
  final int gradeId;
  @JsonKey(name: "grade_name")
  final String gradeName;
  @JsonKey(name: "bind_safe_question")
  final int bindSafeQuestion;
  @JsonKey(name: "bind_pay_password")
  final int bindPayPassword;
  @JsonKey(name: "unread_message_count")
  final int unreadMessageCount;
  @JsonKey(name: "switch_sign")
  final String switchSign;
  @JsonKey(name: "bind_bank")
  final int bindBank;
  @JsonKey(name: "apply_birthday_bonus")
  final int applyBirthdayBonus;
  @JsonKey(name: "auto_bind_game_balance")
  final int autoBindGameBalance;
  @JsonKey(name: "total_bet")
  final String totalBet;
  @JsonKey(name: "total_bonus")
  final String totalBonus;
  @JsonKey(name: "total_rebate")
  final String totalRebate;
  @JsonKey(name: "last_recharge")
  final Last lastRecharge;
  @JsonKey(name: "last_withdraw")
  final Last lastWithdraw;
  @JsonKey(name: "last_message")
  final LastMessage lastMessage;

  UserInfoModel({
    required this.username,
    required this.realname,
    required this.email,
    required this.mobile,
    required this.qq,
    required this.sex,
    required this.birthday,
    required this.lastLoginTime,
    required this.lastLoginAddress,
    required this.showBeginnerGuide,
    required this.gpwd,
    required this.balance,
    required this.balanceFrozen,
    required this.points,
    required this.gradeId,
    required this.gradeName,
    required this.bindSafeQuestion,
    required this.bindPayPassword,
    required this.unreadMessageCount,
    required this.switchSign,
    required this.bindBank,
    required this.applyBirthdayBonus,
    required this.autoBindGameBalance,
    required this.totalBet,
    required this.totalBonus,
    required this.totalRebate,
    required this.lastRecharge,
    required this.lastWithdraw,
    required this.lastMessage,
  });

  UserInfoModel copyWith({
    String? username,
    String? realname,
    dynamic email,
    String? mobile,
    dynamic qq,
    int? sex,
    DateTime? birthday,
    String? lastLoginTime,
    String? lastLoginAddress,
    int? showBeginnerGuide,
    String? gpwd,
    String? balance,
    String? balanceFrozen,
    int? points,
    int? gradeId,
    String? gradeName,
    int? bindSafeQuestion,
    int? bindPayPassword,
    int? unreadMessageCount,
    String? switchSign,
    int? bindBank,
    int? applyBirthdayBonus,
    int? autoBindGameBalance,
    String? totalBet,
    String? totalBonus,
    String? totalRebate,
    Last? lastRecharge,
    Last? lastWithdraw,
    LastMessage? lastMessage,
  }) => UserInfoModel(
    username: username ?? this.username,
    realname: realname ?? this.realname,
    email: email ?? this.email,
    mobile: mobile ?? this.mobile,
    qq: qq ?? this.qq,
    sex: sex ?? this.sex,
    birthday: birthday ?? this.birthday,
    lastLoginTime: lastLoginTime ?? this.lastLoginTime,
    lastLoginAddress: lastLoginAddress ?? this.lastLoginAddress,
    showBeginnerGuide: showBeginnerGuide ?? this.showBeginnerGuide,
    gpwd: gpwd ?? this.gpwd,
    balance: balance ?? this.balance,
    balanceFrozen: balanceFrozen ?? this.balanceFrozen,
    points: points ?? this.points,
    gradeId: gradeId ?? this.gradeId,
    gradeName: gradeName ?? this.gradeName,
    bindSafeQuestion: bindSafeQuestion ?? this.bindSafeQuestion,
    bindPayPassword: bindPayPassword ?? this.bindPayPassword,
    unreadMessageCount: unreadMessageCount ?? this.unreadMessageCount,
    switchSign: switchSign ?? this.switchSign,
    bindBank: bindBank ?? this.bindBank,
    applyBirthdayBonus: applyBirthdayBonus ?? this.applyBirthdayBonus,
    autoBindGameBalance: autoBindGameBalance ?? this.autoBindGameBalance,
    totalBet: totalBet ?? this.totalBet,
    totalBonus: totalBonus ?? this.totalBonus,
    totalRebate: totalRebate ?? this.totalRebate,
    lastRecharge: lastRecharge ?? this.lastRecharge,
    lastWithdraw: lastWithdraw ?? this.lastWithdraw,
    lastMessage: lastMessage ?? this.lastMessage,
  );

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}

@JsonSerializable()
class LastMessage {
  @JsonKey(name: "list")
  final List<dynamic> list;
  @JsonKey(name: "count")
  final int count;

  LastMessage({required this.list, required this.count});

  LastMessage copyWith({List<dynamic>? list, int? count}) =>
      LastMessage(list: list ?? this.list, count: count ?? this.count);

  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LastMessageToJson(this);
}

@JsonSerializable()
class Last {
  @JsonKey(name: "total_recharge")
  final String totalRecharge;
  @JsonKey(name: "total_withdraw")
  final String totalWithdraw;
  @JsonKey(name: "total_bonus")
  final String totalBonus;
  @JsonKey(name: "total_rebate")
  final String totalRebate;
  @JsonKey(name: "list")
  final List<ListElement> list;
  @JsonKey(name: "count")
  final int count;

  Last({
    required this.totalRecharge,
    required this.totalWithdraw,
    required this.totalBonus,
    required this.totalRebate,
    required this.list,
    required this.count,
  });

  Last copyWith({
    String? totalRecharge,
    String? totalWithdraw,
    String? totalBonus,
    String? totalRebate,
    List<ListElement>? list,
    int? count,
  }) => Last(
    totalRecharge: totalRecharge ?? this.totalRecharge,
    totalWithdraw: totalWithdraw ?? this.totalWithdraw,
    totalBonus: totalBonus ?? this.totalBonus,
    totalRebate: totalRebate ?? this.totalRebate,
    list: list ?? this.list,
    count: count ?? this.count,
  );

  factory Last.fromJson(Map<String, dynamic> json) => _$LastFromJson(json);

  Map<String, dynamic> toJson() => _$LastToJson(this);
}

@JsonSerializable()
class ListElement {
  @JsonKey(name: "trade_no")
  final String tradeNo;
  @JsonKey(name: "money")
  final String money;
  @JsonKey(name: "remark")
  final String remark;
  @JsonKey(name: "type")
  final int type;
  @JsonKey(name: "symbol")
  final int symbol;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "time")
  final String time;

  ListElement({
    required this.tradeNo,
    required this.money,
    required this.remark,
    required this.type,
    required this.symbol,
    required this.status,
    required this.time,
  });

  ListElement copyWith({
    String? tradeNo,
    String? money,
    String? remark,
    int? type,
    int? symbol,
    int? status,
    String? time,
  }) => ListElement(
    tradeNo: tradeNo ?? this.tradeNo,
    money: money ?? this.money,
    remark: remark ?? this.remark,
    type: type ?? this.type,
    symbol: symbol ?? this.symbol,
    status: status ?? this.status,
    time: time ?? this.time,
  );

  factory ListElement.fromJson(Map<String, dynamic> json) =>
      _$ListElementFromJson(json);

  Map<String, dynamic> toJson() => _$ListElementToJson(this);
}
