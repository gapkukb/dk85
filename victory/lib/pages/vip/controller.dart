import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/extensions/string.extension.dart';
import 'package:victory/models/models.dart';
import 'package:victory/models/vip.model.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/services/services.dart';

class VicVipController extends GetxController {
  VicVipController();
  final grades = <VicVipLevelModel>[].obs;
  final page = 0.obs;
  final carousel = CarouselSliderController();
  final hasAdvanceBouns = false.obs;
  final hasWeeklyBouns = false.obs;
  final hasMonthlyBouns = false.obs;
  final upgradeBouns = <VicVipBounsModel>[].obs;

  VicUserModel get user => services.user.info.value;
  int get level => services.user.vipLevel - 1;
  VicVipLevelModel get nextLevel => grades.firstWhereOrNull((i) => i.name == (level + 1).toString()) ?? VicVipLevelModel.fromJson({});
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
    if (r == null) return;
    grades.value = r;
    // jumpTo(level - 1);
  }

  void queryAdvanceBouns() async {
    final r = await apis.user.queryMonthlyBonus();
    if (r == null) return;
    hasAdvanceBouns.value = r.isAvailable;
  }

  void queryWeeklyBouns() async {
    final r = await apis.user.queryWeeklyBonus();
    if (r == null) return;
    hasWeeklyBouns.value = r.isAvailable;
  }

  void queryMonthlyBouns() async {
    final r = await apis.user.queryMonthlyBonus();
    if (r == null) return;
    hasMonthlyBouns.value = r.isAvailable;
  }

  void queryVipUpgradeBouns() async {
    final r = await apis.user.queryVipUpgradeBonus();
    if (r == null) return;
    upgradeBouns.value = r;
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
    services.user.updateBalance();
    VicDialog.success();
  }

  void jumpTo(int level) {
    page.value = level;
    carousel.jumpToPage(level);
  }
}
