part of 'apis.dart';

class _AppApi {
  /// 查询所有广告列表
  /// type		是	string	类型1弹窗2广告3活动
  /// position		是	string	位置：首页热门1首页电游2首页捕鱼3首页棋牌4优惠列表5
  final queryAdList = http.get<List<BannerModel>, BannerModel>('/app/ad-list', decoder: BannerModel.fromJson);
  final queryCaptcha = http.get('/app/captcha', normalize: false);

  ///获取每日签到列表
  final checkInList = http.get(
    '/app/get-sign',
  );
  final checkIn = http.post('/app/user-sign', loading: true);

  /// 查询活动详情
  final queryActivityDetail = http.get(
    '/app/activity-details',
  );

  /// 查询活动详情
  final queryAnnouncements = http.get(
    '/app/notice-list',
  );
}
