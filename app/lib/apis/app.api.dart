part of 'apis.dart';

class _AppApi {
  /// 查询所有广告列表
  /// type		是	string	类型1弹窗2广告3活动
  /// position		是	string	位置：首页热门1首页电游2首页捕鱼3首页棋牌4优惠列表5
  final queryAdList = http.get('/app/ad-list', decoder: AdModelWrapper.fromJson);
  final queryCaptcha = http.get('/app/captcha', normalizable: false);

  ///获取每日签到列表
  final checkInList = http.get('/app/get-sign', decoder: DailyCheckInModelWrapper.fromJson);
  final checkIn = http.post('/app/user-sign', loading: true);
}
