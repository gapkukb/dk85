part of 'dialogs.dart';

void registerDialogs() {
  final dialogs = Dialogs.to;
  // dialogs.add(DialogBuilder(id: DialogNames.forceUpdate, builder: () => ForceUpdateModal()));
  dialogs.add(DialogBuilder(id: DialogNames.completion, requireAuth: true, builder: () => CompletionModal()));
  dialogs.add(DialogBuilder(id: DialogNames.topUpBouns, requireAuth: true, builder: () => TopUpBonusModal()));
  dialogs.add(DialogBuilder(id: DialogNames.dailyCheckIn, builder: () => DailyCheckInModal()));
  dialogs.add(DialogBuilder(id: DialogNames.announcement, manual: false, requireAuth: false, builder: () => AnnouncementModal()));
  // dialogs.add(DialogBuilder(id: DialogNames.gameTrial, builder: () => GameTrialModal()));
}
