part of 'apis.dart';

class _FundApi {
  final queryTopUpList = http.get('/app/payment-list', decoder: TopUpModelWrapper.fromJson);
  final createTopUpOrder = http.post('/pay/payment/order', decoder: TopUpOrderModelWrapper.fromJson, loading: true);
  final queryWithdrawList = http.get('/app/withdraw-channel-list', decoder: WithdrawalModelWrapper.fromJson);
  final withdraw = http.post('/app/withdraw-new', loading: true);
  final matchTopup = http.post('/pay/payment/match', loading: true);
}
