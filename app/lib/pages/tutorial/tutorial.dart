import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../theme/index.dart';
import '../../ui/button/index.dart';

part 'tutorial_targets.dart';

void showTutorial(BuildContext context) {
  Showcase(
    key: fundsGuideKey,
    description: 'Click here to see menu options',
    child: const Icon(Icons.menu, color: Colors.black45),
  );

  Showcase.withWidget(
    key: promosGuideKey,
    height: 80,
    width: 140,
    targetShapeBorder: const CircleBorder(),
    container: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[Text("test")]),
    child: const Text("test"),
  );
  debugPrint("999999999999999999999999999999");
  ShowCaseWidget.of(context).startShowCase([fundsGuideKey, promosGuideKey]);
}

void showTutorial1(BuildContext context) {
  TutorialCoachMark tutorial = TutorialCoachMark(
    targets: createTargets(), // List<TargetFocus>
    // colorShadow: Colors.red, // DEFAULT Colors.black
    // opacityShadow = 0.8,
    // alignSkip: Alignment.bottomRight,
    // textSkip: "SKIP",
    // textStyleSkip: const TextStyle(color: Colors.white),
    // skipWidget: MyWidget(),
    hideSkip: true,

    // showSkipInLastTarget: true,
    // paddingFocus: 10,
    // focusAnimationDuration: Duration(milliseconds: 500),
    // unFocusAnimationDuration: Duration(milliseconds: 500),
    // pulseAnimationDuration: Duration(milliseconds: 500),
    // pulseVariation: Tween(begin: 1.0, end: 0.99),
    // pulseEnable: true,
    // imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
    // initialFocus: 0,
    // useSafeArea: true,
    // finish: (){},
    // clickTarget: (TargetFocus) {},
    // onClickTargetWithTapPosition: (TargetFocus, TapDownDetails) {},
    // clickOverlay: (TargetFocus) {},
    disableBackButton: true, // If true disable native back button.
    onFinish: () {
      debugPrint("finish");
    },
    onClickTargetWithTapPosition: (target, tapDetails) {
      debugPrint("target: $target");
      debugPrint("clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
    },
    onClickTarget: (target) {
      debugPrint(target.toString());
    },
    onSkip: () {
      debugPrint("skip");
      return true;
    },
  )..show(context: context);

  // tutorial.skip();
  // tutorial.finish();
  // tutorial.next(); // call next target programmatically
  // tutorial.previous(); // call previous target programmatically
  // tutorial.goTo(3); // call target programmatically by index
}
