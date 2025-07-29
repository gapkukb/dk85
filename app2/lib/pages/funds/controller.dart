import '../deposit/index.dart';
import '/routes/app_pages.dart';
import 'package:flutter/material.dart';
import '/pages/deposit/view.dart';
import '/pages/withdrawal/view.dart';
import 'package:get/get.dart';

class FundsController extends GetxController {
  FundsController();
  final isWithdrawal = false.obs;

  changeView(bool viewType) {
    isWithdrawal.value = viewType;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.DASHBOARD + Routes.FUNDS + Routes.WITHDRAWAL:
        return GetPageRoute(
          settings: settings,
          page: () => WithdrawalView(),
          // binding: WithdrawalBinding(),
          transition: Transition.leftToRightWithFade,
        );
    }
    return GetPageRoute(
      settings: settings,
      page: () => DepositView(),
      // binding: DepositBinding(),
      transition: Transition.leftToRightWithFade,
    );
  }
}
