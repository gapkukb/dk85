part of 'modals.dart';

void _registerModals() {
  VicModals.shared
    ..add(
      VicModalBuilder(
        name: VicModalName.completion,
        builder: () => const VicModalCompletionProfile(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.firstDepositBouns,
        builder: () => const VicModalFirstDepositBonus(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.luckSpin,
        builder: () => const VicModalLuckySpin(),
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.dailyCheckIn,
        builder: () => const VicModalDailyCheckIn(),
        // autoRemove: false,
      ),
    )
    ..add(
      VicModalBuilder(
        name: VicModalName.announcement,
        builder: () => const VicAnnouncementModal(),
      ),
    );
}
