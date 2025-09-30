part of 'modals.dart';

void _registerModals() {
  VicModals.shared
    ..add(
      VicModalBuilder(
        name: VicModalName.first_deposit_bouns,
        builder: ([Object? params]) => const VicModalFirstDepositBonus(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.completion,
        builder: ([Object? params]) => const VicModalCompletionProfile(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.lucky_spin,
        builder: ([Object? params]) => const VicModalLuckyWheel(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.daily_check_in,
        builder: ([Object? params]) => const VicModalDailyCheckIn(),
        peroidic: VicModalPeriodic.any,
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.announcement,
        builder: ([Object? params]) => const VicAnnouncementModal(),
        requireAuth: false,
      ),
    );
}
