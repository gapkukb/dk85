part of 'modals.dart';

void _registerModals() {
  VicModals.shared
    ..add(
      VicModalBuilder(
        name: VicModalName.first_deposit_bouns,
        builder: () => const VicModalFirstDepositBonus(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.completion,
        builder: () => const VicModalCompletionProfile(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.lucky_spin,
        builder: () => const VicModalLuckySpin(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.daily_check_in,
        builder: () => const VicModalDailyCheckIn(),
        peroidic: VicModalPeriodic.any,
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.announcement,
        builder: () => const VicAnnouncementModal(),
        requireAuth: false,
        manual: false,
      ),
    );
}
