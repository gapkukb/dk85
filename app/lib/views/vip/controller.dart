import 'package:app/apis/apis.dart';
import 'package:app/helper/math.dart';
import 'package:app/models/vip.model.dart';
import 'package:app/services/index.dart';
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
  num get level => services.user.userInfo.value!.gradeId;

  VipModel get myLevel => grades.firstWhereOrNull((i) => i.id == level) ?? VipModel.fromJson({});

  double get betProgress => safeDiv(myLevel.betAmount, myLevel.betLimit);
  double get chargeProgress => safeDiv(myLevel.depositAmount, myLevel.paymentLimit);

  void onCarouselPageChanged(int index, CarouselPageChangedReason reason) {
    page.value = index;
  }

  void queryConfig() async {
    final r = await apis.user.queryGradeList();
    grades.value = r.data;
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

  @override
  void onInit() {
    queryConfig();
    super.onInit();
  }
}
