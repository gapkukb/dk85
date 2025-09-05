library;

import 'package:app/models/ad_list.model.dart';
import 'package:app/models/auth.model.dart';
import 'package:app/models/balance.model.dart';
import 'package:app/models/daily_check_in.model.dart';
import 'package:app/models/game.model.dart';
import 'package:app/models/top_up.model.dart';
import 'package:app/models/top_up_order.model.dart';
import 'package:app/models/user_info.model.dart';
import 'package:app/models/withdrawal.model.dart';
import '../http/index.dart';

part './app.api.dart';
part './game.api.dart';
part './user.api.dart';
part './funds.api.dart';

class _Apis {
  final app = _AppApi();
  final game = _GameApi();
  final funds = _FundApi();
  final user = _UserApi();
}

final apis = _Apis();
