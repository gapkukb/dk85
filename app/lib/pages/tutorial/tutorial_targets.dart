part of 'tutorial.dart';

final fundsGuideKey = GlobalKey();
final promosGuideKey = GlobalKey();

List<TargetFocus> createTargets() {
  final List<TargetFocus> targets = [];

  targets.add(
    TargetFocus(
      identify: '充值引导',
      keyTarget: fundsGuideKey,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.network("https://dk85.com/image/platform/guide2.png"),
              // AKButton.small(onPressed: () {}, text: "app.gotIt".tr, color: AppColors.primary),
            ],
          ),
        ),
      ],
    ),
  );

  targets.add(
    TargetFocus(
      identify: '福利和领取引导',
      keyTarget: promosGuideKey,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.network("https://dk85.com/image/platform/guide1.png"),
              // AKButton.small(onPressed: () {}, text: "app.gotIt".tr, color: AppColors.primary),
            ],
          ),
        ),
      ],
    ),
  );

  return targets;
}
