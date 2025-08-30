// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(
  Map<String, dynamic> json,
) => UserInfoModel(
  username: json['username'] as String,
  realname: json['realname'] as String,
  email: json['email'],
  mobile: json['mobile'] as String,
  qq: json['qq'],
  sex: (json['sex'] as num).toInt(),
  birthday: DateTime.parse(json['birthday'] as String),
  lastLoginTime: json['last_login_time'] as String,
  lastLoginAddress: json['last_login_address'] as String,
  showBeginnerGuide: (json['show_beginner_guide'] as num).toInt(),
  gpwd: json['gpwd'] as String,
  balance: json['balance'] as String,
  balanceFrozen: json['balance_frozen'] as String,
  points: (json['points'] as num).toInt(),
  gradeId: (json['grade_id'] as num).toInt(),
  gradeName: json['grade_name'] as String,
  bindSafeQuestion: (json['bind_safe_question'] as num).toInt(),
  bindPayPassword: (json['bind_pay_password'] as num).toInt(),
  unreadMessageCount: (json['unread_message_count'] as num).toInt(),
  switchSign: json['switch_sign'] as String,
  bindBank: (json['bind_bank'] as num).toInt(),
  applyBirthdayBonus: (json['apply_birthday_bonus'] as num).toInt(),
  autoBindGameBalance: (json['auto_bind_game_balance'] as num).toInt(),
  totalBet: json['total_bet'] as String,
  totalBonus: json['total_bonus'] as String,
  totalRebate: json['total_rebate'] as String,
  lastRecharge: Last.fromJson(json['last_recharge'] as Map<String, dynamic>),
  lastWithdraw: Last.fromJson(json['last_withdraw'] as Map<String, dynamic>),
  lastMessage: LastMessage.fromJson(
    json['last_message'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'realname': instance.realname,
      'email': instance.email,
      'mobile': instance.mobile,
      'qq': instance.qq,
      'sex': instance.sex,
      'birthday': instance.birthday.toIso8601String(),
      'last_login_time': instance.lastLoginTime,
      'last_login_address': instance.lastLoginAddress,
      'show_beginner_guide': instance.showBeginnerGuide,
      'gpwd': instance.gpwd,
      'balance': instance.balance,
      'balance_frozen': instance.balanceFrozen,
      'points': instance.points,
      'grade_id': instance.gradeId,
      'grade_name': instance.gradeName,
      'bind_safe_question': instance.bindSafeQuestion,
      'bind_pay_password': instance.bindPayPassword,
      'unread_message_count': instance.unreadMessageCount,
      'switch_sign': instance.switchSign,
      'bind_bank': instance.bindBank,
      'apply_birthday_bonus': instance.applyBirthdayBonus,
      'auto_bind_game_balance': instance.autoBindGameBalance,
      'total_bet': instance.totalBet,
      'total_bonus': instance.totalBonus,
      'total_rebate': instance.totalRebate,
      'last_recharge': instance.lastRecharge,
      'last_withdraw': instance.lastWithdraw,
      'last_message': instance.lastMessage,
    };

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => LastMessage(
  list: json['list'] as List<dynamic>,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
    <String, dynamic>{'list': instance.list, 'count': instance.count};

Last _$LastFromJson(Map<String, dynamic> json) => Last(
  totalRecharge: json['total_recharge'] as String,
  totalWithdraw: json['total_withdraw'] as String,
  totalBonus: json['total_bonus'] as String,
  totalRebate: json['total_rebate'] as String,
  list: (json['list'] as List<dynamic>)
      .map((e) => ListElement.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$LastToJson(Last instance) => <String, dynamic>{
  'total_recharge': instance.totalRecharge,
  'total_withdraw': instance.totalWithdraw,
  'total_bonus': instance.totalBonus,
  'total_rebate': instance.totalRebate,
  'list': instance.list,
  'count': instance.count,
};

ListElement _$ListElementFromJson(Map<String, dynamic> json) => ListElement(
  tradeNo: json['trade_no'] as String,
  money: json['money'] as String,
  remark: json['remark'] as String,
  type: (json['type'] as num).toInt(),
  symbol: (json['symbol'] as num).toInt(),
  status: (json['status'] as num).toInt(),
  time: json['time'] as String,
);

Map<String, dynamic> _$ListElementToJson(ListElement instance) =>
    <String, dynamic>{
      'trade_no': instance.tradeNo,
      'money': instance.money,
      'remark': instance.remark,
      'type': instance.type,
      'symbol': instance.symbol,
      'status': instance.status,
      'time': instance.time,
    };
