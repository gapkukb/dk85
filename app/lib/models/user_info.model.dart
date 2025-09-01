import 'package:meta/meta.dart';
import 'dart:convert';

class UserModelWrapper {
  final int code;
  final int status;
  final String message;
  final UserModel data;

  UserModelWrapper({required this.code, required this.status, required this.message, required this.data});

  factory UserModelWrapper.fromRawJson(String str) => UserModelWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModelWrapper.fromJson(Map<String, dynamic> json) => UserModelWrapper(code: json["code"], status: json["status"], message: json["message"], data: UserModel.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"code": code, "status": status, "message": message, "data": data.toJson()};
}

class UserModel {
  final String username;
  final String realname;
  final String email;
  final String mobile;
  final String qq;
  final int sex;
  final dynamic birthday;
  final String lastLoginTime;
  final String lastLoginAddress;
  final int showBeginnerGuide;
  final int payTimes;
  final int hasPass;
  final double balance;
  final int balanceFrozen;
  final int points;
  final int gradeId;
  final String gradeName;
  final int bindSafeQuestion;
  final int bindPayPassword;
  final int unreadMessageCount;
  final String switchSign;
  final int bindBank;
  final int applyBirthdayBonus;
  final int autoBindGameBalance;
  final String totalBet;
  final String totalBonus;
  final String totalRebate;
  final Last lastRecharge;
  final Last lastWithdraw;
  final LastMessage lastMessage;

  UserModel({
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
    required this.payTimes,
    required this.hasPass,
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

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"],
    realname: json["realname"],
    email: json["email"],
    mobile: json["mobile"],
    qq: json["qq"],
    sex: json["sex"],
    birthday: json["birthday"],
    lastLoginTime: json["last_login_time"],
    lastLoginAddress: json["last_login_address"],
    showBeginnerGuide: json["show_beginner_guide"],
    payTimes: json["pay_times"],
    hasPass: json["has_pass"],
    balance: json["balance"]?.toDouble(),
    balanceFrozen: json["balance_frozen"],
    points: json["points"],
    gradeId: json["grade_id"],
    gradeName: json["grade_name"],
    bindSafeQuestion: json["bind_safe_question"],
    bindPayPassword: json["bind_pay_password"],
    unreadMessageCount: json["unread_message_count"],
    switchSign: json["switch_sign"],
    bindBank: json["bind_bank"],
    applyBirthdayBonus: json["apply_birthday_bonus"],
    autoBindGameBalance: json["auto_bind_game_balance"],
    totalBet: json["total_bet"],
    totalBonus: json["total_bonus"],
    totalRebate: json["total_rebate"],
    lastRecharge: Last.fromJson(json["last_recharge"]),
    lastWithdraw: Last.fromJson(json["last_withdraw"]),
    lastMessage: LastMessage.fromJson(json["last_message"]),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "realname": realname,
    "email": email,
    "mobile": mobile,
    "qq": qq,
    "sex": sex,
    "birthday": birthday,
    "last_login_time": lastLoginTime,
    "last_login_address": lastLoginAddress,
    "show_beginner_guide": showBeginnerGuide,
    "pay_times": payTimes,
    "has_pass": hasPass,
    "balance": balance,
    "balance_frozen": balanceFrozen,
    "points": points,
    "grade_id": gradeId,
    "grade_name": gradeName,
    "bind_safe_question": bindSafeQuestion,
    "bind_pay_password": bindPayPassword,
    "unread_message_count": unreadMessageCount,
    "switch_sign": switchSign,
    "bind_bank": bindBank,
    "apply_birthday_bonus": applyBirthdayBonus,
    "auto_bind_game_balance": autoBindGameBalance,
    "total_bet": totalBet,
    "total_bonus": totalBonus,
    "total_rebate": totalRebate,
    "last_recharge": lastRecharge.toJson(),
    "last_withdraw": lastWithdraw.toJson(),
    "last_message": lastMessage.toJson(),
  };
}

class LastMessage {
  final List<dynamic> list;
  final int count;

  LastMessage({required this.list, required this.count});

  factory LastMessage.fromRawJson(String str) => LastMessage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(list: List<dynamic>.from(json["list"].map((x) => x)), count: json["count"]);

  Map<String, dynamic> toJson() => {"list": List<dynamic>.from(list.map((x) => x)), "count": count};
}

class Last {
  final String totalRecharge;
  final int totalWithdraw;
  final String totalBonus;
  final int totalRebate;
  final List<ListElement> list;
  final int count;

  Last({required this.totalRecharge, required this.totalWithdraw, required this.totalBonus, required this.totalRebate, required this.list, required this.count});

  factory Last.fromRawJson(String str) => Last.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Last.fromJson(Map<String, dynamic> json) => Last(
    totalRecharge: json["total_recharge"],
    totalWithdraw: json["total_withdraw"],
    totalBonus: json["total_bonus"],
    totalRebate: json["total_rebate"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "total_recharge": totalRecharge,
    "total_withdraw": totalWithdraw,
    "total_bonus": totalBonus,
    "total_rebate": totalRebate,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "count": count,
  };
}

class ListElement {
  final String tradeNo;
  final String money;
  final String remark;
  final int type;
  final int symbol;
  final int status;
  final String time;

  ListElement({required this.tradeNo, required this.money, required this.remark, required this.type, required this.symbol, required this.status, required this.time});

  factory ListElement.fromRawJson(String str) => ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) =>
      ListElement(tradeNo: json["trade_no"], money: json["money"], remark: json["remark"], type: json["type"], symbol: json["symbol"], status: json["status"], time: json["time"]);

  Map<String, dynamic> toJson() => {"trade_no": tradeNo, "money": money, "remark": remark, "type": type, "symbol": symbol, "status": status, "time": time};
}
