part of 'dialogs.dart';

void registerDialogs() {
  final dialogs = Dialogs.to;
  dialogs.add(DialogBuilder(id: DialogNames.announcement, manual: true, builder: () => AnnouncementModal()));
  // dialogs.add(DialogBuilder(id: DialogNames.dailyCheckIn, requireAuth: true, manual: true, builder: () => DailyCheckInModal()));
  // dialogs.add(DialogBuilder(id: DialogNames.topUpBouns, builder: () => TopUpBonusModal()));
  // dialogs.add(DialogBuilder(id: DialogNames.gameTrial, builder: () => GameTrialModal()));
  // dialogs.add(DialogBuilder(id: DialogNames.forceUpdate, builder: () => ForceUpdateModal()));
}
