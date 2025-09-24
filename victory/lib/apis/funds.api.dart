part of 'apis.dart';

class _FundApi {
  final queryDepositChannels = http.get('/app/payment-list', decoder: _mapToList(models.VicDepositChannelsModel.fromJson));
  final createDepositOrder = http.post('/pay/payment/order', decoder: models.VicPaymentOrderModel.fromJson, loading: true);
  final queryWithdrawalChannels = http.get.list('/app/withdraw-channel-list', decoder: models.VicWithdrawalChannelModel.fromJson);
  final withdraw = http.post('/app/withdraw-new', loading: true);
  final matchTopup = http.post('/pay/payment/match', loading: true);
}
