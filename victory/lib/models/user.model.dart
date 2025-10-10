part of models;

class VicUserModel extends VicBaseModel {
  VicUserModel({
    required this.id,
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
    required this.gameBalance,
    required this.totalBet,
    required this.totalBonus,
    required this.totalRebate,
    required this.lastRecharge,
    required this.lastWithdraw,
    required this.lastMessage,
    required this.totalDepositAmount,
    required this.totalBetAmount,
    required this.totalRebateAmount,
    required this.isSignIn,
    required this.needWaterAmount,
  });

  final int id;
  final String username;
  final String realname;
  final String email;
  final String mobile;
  final dynamic qq;
  final num sex;
  final DateTime? birthday;
  final DateTime? lastLoginTime;
  final String lastLoginAddress;
  final int showBeginnerGuide;
  final num payTimes;
  final num hasPass;
  final num balance;
  final num balanceFrozen;
  final num points;
  final int gradeId;
  final String gradeName;
  final num bindSafeQuestion;
  final num bindPayPassword;
  final num unreadMessageCount;
  final num switchSign;
  final num bindBank;
  final num applyBirthdayBonus;
  final num autoBindGameBalance;
  final num gameBalance;
  final num totalBet;
  final num totalBonus;
  final num totalRebate;
  final LastRecharge? lastRecharge;
  final LastWithdraw? lastWithdraw;
  final LastMessage? lastMessage;
  final num totalDepositAmount;
  final num totalBetAmount;
  final num totalRebateAmount;
  final bool isSignIn;
  final num needWaterAmount;

  factory VicUserModel.fromJson(Map<String, dynamic> json) {
    return VicUserModel(
      id: json["id"] ?? 0,
      username: json["username"] ?? "",
      realname: json["realname"] ?? "",
      email: json["email"] ?? "",
      mobile: json["mobile"] ?? "",
      qq: json["qq"],
      sex: json["sex"] ?? 0,
      birthday: DateTime.tryParse(json["birthday"] ?? ""),
      lastLoginTime: DateTime.tryParse(json["last_login_time"] ?? ""),
      lastLoginAddress: json["last_login_address"] ?? "",
      showBeginnerGuide: json["show_beginner_guide"] ?? 0,
      payTimes: json["pay_times"] ?? 0,
      hasPass: json["has_pass"] ?? 0,
      balance: json["balance"] ?? 0,
      balanceFrozen: json["balance_frozen"] ?? 0,
      points: json["points"] ?? 0,
      gradeId: json["grade_id"] ?? 0,
      gradeName: json["grade_name"] ?? "1",
      bindSafeQuestion: json["bind_safe_question"] ?? 0,
      bindPayPassword: json["bind_pay_password"] ?? 0,
      unreadMessageCount: json["unread_message_count"] ?? 0,
      switchSign: json["switch_sign"] ?? 0,
      bindBank: json["bind_bank"] ?? 0,
      applyBirthdayBonus: json["apply_birthday_bonus"] ?? 0,
      autoBindGameBalance: json["auto_bind_game_balance"] ?? 0,
      gameBalance: json["gameBalance"] ?? 0,
      totalBet: json["total_bet"] ?? 0,
      totalBonus: json["total_bonus"] ?? 0,
      totalRebate: json["total_rebate"] ?? 0,
      lastRecharge: json["last_recharge"] == null ? null : LastRecharge.fromJson(json["last_recharge"]),
      lastWithdraw: json["last_withdraw"] == null ? null : LastWithdraw.fromJson(json["last_withdraw"]),
      lastMessage: json["last_message"] == null ? null : LastMessage.fromJson(json["last_message"]),
      totalDepositAmount: json["total_deposit_amount"] ?? 0,
      totalBetAmount: json["total_bet_amount"] ?? 0,
      totalRebateAmount: json["total_rebate_amount"] ?? 0,
      isSignIn: json["is_sign_in"] ?? false,
      needWaterAmount: json["need_water_amount"] ?? 0,
    );
  }

  String get shortName => username.length > 8 ? '${username.substring(0, 4)}***${username.substring(username.length - 3)}' : username;

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "realname": realname,
    "email": email,
    "mobile": mobile,
    "qq": qq,
    "sex": sex,
    "birthday": birthday.toString(),
    "last_login_time": lastLoginTime?.toIso8601String(),
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
    "gameBalance": gameBalance,
    "total_bet": totalBet,
    "total_bonus": totalBonus,
    "total_rebate": totalRebate,
    "last_recharge": lastRecharge?.toJson(),
    "last_withdraw": lastWithdraw?.toJson(),
    "last_message": lastMessage?.toJson(),
    "total_deposit_amount": totalDepositAmount,
    "total_bet_amount": totalBetAmount,
    "total_rebate_amount": totalRebateAmount,
    "is_sign_in": isSignIn,
    "need_water_amount": needWaterAmount,
  };

  @override
  String toString() {
    return "$id, $username, $realname, $email, $mobile, $qq, $sex, $birthday, $lastLoginTime, $lastLoginAddress, $showBeginnerGuide, $payTimes, $hasPass, $balance, $balanceFrozen, $points, $gradeId, $gradeName, $bindSafeQuestion, $bindPayPassword, $unreadMessageCount, $switchSign, $bindBank, $applyBirthdayBonus, $autoBindGameBalance, $gameBalance, $totalBet, $totalBonus, $totalRebate, $lastRecharge, $lastWithdraw, $lastMessage, $totalDepositAmount, $totalBetAmount, $totalRebateAmount, $isSignIn, ";
  }
}

class LastMessage {
  LastMessage({
    required this.list,
    required this.count,
  });

  final List<LastMessageList> list;
  final num count;

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      list: json["list"] == null ? [] : List<LastMessageList>.from(json["list"]!.map((x) => LastMessageList.fromJson(x))),
      count: json["count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "list": list.map((x) => x.toJson()).toList(),
    "count": count,
  };

  @override
  String toString() {
    return "$list, $count, ";
  }
}

class LastMessageList {
  LastMessageList({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.status,
  });

  final int id;
  final String title;
  final String content;
  final DateTime? createdAt;
  final num status;

  factory LastMessageList.fromJson(Map<String, dynamic> json) {
    return LastMessageList(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      content: json["content"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      status: json["status"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "created_at": createdAt?.toIso8601String(),
    "status": status,
  };

  @override
  String toString() {
    return "$id, $title, $content, $createdAt, $status, ";
  }
}

class LastRecharge {
  LastRecharge({
    required this.totalRecharge,
    required this.totalWithdraw,
    required this.totalBonus,
    required this.totalRebate,
    required this.list,
    required this.count,
  });

  final num totalRecharge;
  final num totalWithdraw;
  final num totalBonus;
  final num totalRebate;
  final List<LastRechargeList> list;
  final num count;

  factory LastRecharge.fromJson(Map<String, dynamic> json) {
    return LastRecharge(
      totalRecharge: json["total_recharge"] ?? 0,
      totalWithdraw: json["total_withdraw"] ?? 0,
      totalBonus: json["total_bonus"] ?? 0,
      totalRebate: json["total_rebate"] ?? 0,
      list: json["list"] == null ? [] : List<LastRechargeList>.from(json["list"]!.map((x) => LastRechargeList.fromJson(x))),
      count: json["count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "total_recharge": totalRecharge,
    "total_withdraw": totalWithdraw,
    "total_bonus": totalBonus,
    "total_rebate": totalRebate,
    "list": list.map((x) => x.toJson()).toList(),
    "count": count,
  };

  @override
  String toString() {
    return "$totalRecharge, $totalWithdraw, $totalBonus, $totalRebate, $list, $count, ";
  }
}

class LastRechargeList {
  LastRechargeList({
    required this.channel,
    required this.cardNo,
    required this.accountId,
    required this.sysTradeNo,
    required this.imageUrl,
    required this.changeType,
    required this.tradeNo,
    required this.money,
    required this.remark,
    required this.type,
    required this.symbol,
    required this.status,
    required this.time,
  });

  final String channel;
  final String cardNo;
  final int accountId;
  final String sysTradeNo;
  final String imageUrl;
  final num changeType;
  final String tradeNo;
  final num money;
  final String remark;
  final num type;
  final num symbol;
  final num status;
  final DateTime? time;

  factory LastRechargeList.fromJson(Map<String, dynamic> json) {
    return LastRechargeList(
      channel: json["channel"] ?? "",
      cardNo: json["card_no"] ?? "",
      accountId: json["account_id"] ?? 0,
      sysTradeNo: json["sys_trade_no"] ?? "",
      imageUrl: json["image_url"] ?? "",
      changeType: json["change_type"] ?? 0,
      tradeNo: json["trade_no"] ?? "",
      money: json["money"] ?? 0,
      remark: json["remark"] ?? "",
      type: json["type"] ?? 0,
      symbol: json["symbol"] ?? 0,
      status: json["status"] ?? 0,
      time: DateTime.tryParse(json["time"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "channel": channel,
    "card_no": cardNo,
    "account_id": accountId,
    "sys_trade_no": sysTradeNo,
    "image_url": imageUrl,
    "change_type": changeType,
    "trade_no": tradeNo,
    "money": money,
    "remark": remark,
    "type": type,
    "symbol": symbol,
    "status": status,
    "time": time?.toIso8601String(),
  };

  @override
  String toString() {
    return "$channel, $cardNo, $accountId, $sysTradeNo, $imageUrl, $changeType, $tradeNo, $money, $remark, $type, $symbol, $status, $time, ";
  }
}

class LastWithdraw {
  LastWithdraw({
    required this.totalRecharge,
    required this.totalWithdraw,
    required this.totalBonus,
    required this.totalRebate,
    required this.list,
    required this.count,
  });

  final num totalRecharge;
  final num totalWithdraw;
  final num totalBonus;
  final num totalRebate;
  final List<LastWithdrawList> list;
  final num count;

  factory LastWithdraw.fromJson(Map<String, dynamic> json) {
    return LastWithdraw(
      totalRecharge: json["total_recharge"] ?? 0,
      totalWithdraw: json["total_withdraw"] ?? 0,
      totalBonus: json["total_bonus"] ?? 0,
      totalRebate: json["total_rebate"] ?? 0,
      list: json["list"] == null ? [] : List<LastWithdrawList>.from(json["list"]!.map((x) => LastWithdrawList.fromJson(x))),
      count: json["count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "total_recharge": totalRecharge,
    "total_withdraw": totalWithdraw,
    "total_bonus": totalBonus,
    "total_rebate": totalRebate,
    "list": list.map((x) => x.toJson()).toList(),
    "count": count,
  };

  @override
  String toString() {
    return "$totalRecharge, $totalWithdraw, $totalBonus, $totalRebate, $list, $count, ";
  }
}

class LastWithdrawList {
  LastWithdrawList({
    required this.channel,
    required this.changeType,
    required this.tradeNo,
    required this.money,
    required this.remark,
    required this.type,
    required this.symbol,
    required this.status,
    required this.time,
  });

  final String channel;
  final num changeType;
  final String tradeNo;
  final num money;
  final String remark;
  final num type;
  final num symbol;
  final num status;
  final DateTime? time;

  factory LastWithdrawList.fromJson(Map<String, dynamic> json) {
    return LastWithdrawList(
      channel: json["channel"] ?? "",
      changeType: json["change_type"] ?? 0,
      tradeNo: json["trade_no"] ?? "",
      money: json["money"] ?? 0,
      remark: json["remark"] ?? "",
      type: json["type"] ?? 0,
      symbol: json["symbol"] ?? 0,
      status: json["status"] ?? 0,
      time: DateTime.tryParse(json["time"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "channel": channel,
    "change_type": changeType,
    "trade_no": tradeNo,
    "money": money,
    "remark": remark,
    "type": type,
    "symbol": symbol,
    "status": status,
    "time": time?.toIso8601String(),
  };

  @override
  String toString() {
    return "$channel, $changeType, $tradeNo, $money, $remark, $type, $symbol, $status, $time, ";
  }
}
