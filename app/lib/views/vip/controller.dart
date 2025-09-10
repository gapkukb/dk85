import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/helper/math.dart';
import 'package:app/models/user_info.model.dart';
import 'package:app/models/vip.model.dart';
import 'package:app/services/index.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class VipController extends GetxController {
  VipController();
  final grades = <VipModel>[].obs;
  final page = 0.obs;
  final carousel = CarouselSliderController();
  final hasAdvanceBouns = false.obs;
  final hasWeeklyBouns = false.obs;
  final hasMonthlyBouns = false.obs;
  final upgradeBouns = <VipBouns>[].obs;

  UserModel get user => services.user.userInfo.value!;
  int get level => int.tryParse(user.gradeName) ?? 0;
  VipModel get nextLevel => grades.firstWhereOrNull((i) => i.name == (level + 1).toString()) ?? VipModel.fromJson({});
  num get betLimit => nextLevel.betLimit;
  num get paymentLimit => nextLevel.paymentLimit;

  double get betProgress {
    if (betLimit == 0) return 0;
    return user.totalBetAmount / betLimit;
  }

  double get chargeProgress {
    if (paymentLimit == 0) return 0;
    return user.totalDepositAmount / paymentLimit;
  }

  @override
  void onInit() {
    queryConfig();
    queryWeeklyBouns();
    queryMonthlyBouns();
    queryVipUpgradeBouns();
    super.onInit();
  }

  void onCarouselPageChanged(int index, CarouselPageChangedReason reason) {
    page.value = index;
  }

  void queryConfig() async {
    final r = await apis.user.queryGradeList();
    grades.value = r.data;
    jumpTo(level - 1);
  }

  void queryAdvanceBouns() async {
    final r = await apis.user.queryMonthlyBonus();
    hasAdvanceBouns.value = r.data.isAvailable;
  }

  void queryWeeklyBouns() async {
    final r = await apis.user.queryWeeklyBonus();
    hasWeeklyBouns.value = r.data.isAvailable;
  }

  void queryMonthlyBouns() async {
    final r = await apis.user.queryMonthlyBonus();
    hasMonthlyBouns.value = r.data.isAvailable;
  }

  void queryVipUpgradeBouns() async {
    final r = await apis.user.queryVipUpgradeBonus();
    upgradeBouns.value = r.data;
    if (upgradeBouns.isNotEmpty) {
      final index = upgradeBouns.first.gradeId.toInt();
      jumpTo(index);
    }
  }

  void cliamWeeklyBouns() async {
    await apis.user.claimWeeklyBonus();
    hasWeeklyBouns.value = false;
    _next();
  }

  void claimMonthlyBonus() async {
    await apis.user.claimMonthlyBonus();
    hasMonthlyBouns.value = false;
    _next();
  }

  void claimVipUpgradeBonus(num gradeId) async {
    await apis.user.claimVipUpgradeBonus(payload: {'grade_id': gradeId});
    _next();
    queryVipUpgradeBouns();
  }

  void _next() {
    services.user.queryBalance();
    showSuccess();
  }

  void jumpTo(int level) {
    page.value = level;
    carousel.jumpToPage(level);
  }
}
