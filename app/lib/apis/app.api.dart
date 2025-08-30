part of 'index.dart';

/// 查询所有广告列表
/// type		是	string	类型1弹窗2广告3活动
/// position		是	string	位置：首页热门1首页电游2首页捕鱼3首页棋牌4优惠列表5
final queryAdList = get.list('/app/ad-list', AdModel.fromJson);
final queryCaptcha = get(
  '/app/captcha',
  null,
  HttpOptions(normalizable: false),
  Options(responseType: ResponseType.bytes),
);
