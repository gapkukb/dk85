part of 'index.dart';

final queryTopUpChannelsApi = get('/app/payment-list', TopUpModelWrapper.fromJson);
final createTopUpOrder = post('/pay/payment/order', TopUpOrderModelWrapper.fromJson);
final queryWithdrawChannelsApi = get('/app/withdraw-channel-list', WithdrawalModelWrapper.fromJson);
final withdrawApi = post('/app/withdraw-new');
final matchTopupApi = post('/pay/payment/match');
