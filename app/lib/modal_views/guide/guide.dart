import 'package:app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

final guideOne = GlobalKey();
final guideTwo = GlobalKey();

void showGuide() {
  List<TargetFocus> targets = [];
  // if (storage.showGuide.value) return;

  late final TutorialCoachMark tutorial;
  targets.add(
    TargetFocus(
      identify: "step1",
      keyTarget: guideOne,
      shape: ShapeLightFocus.RRect,
      radius: 22,
      contents: [
        TargetContent(
          align: ContentAlign.custom,
          customPosition: CustomTargetContentPosition(top: (guideOne.currentContext?.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dy, left: 0, right: 0),
          padding: EdgeInsets.all(0),
          child: Container(
            height: 208,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/guide1.webp'), fit: BoxFit.fitHeight),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => tutorial.next(),
              child: Align(alignment: Alignment(0, 1), child: SizedBox(height: 48)),
            ),
          ),
        ),
      ],
    ),
  );

  targets.add(
    TargetFocus(
      identify: "step2",
      keyTarget: guideTwo,
      shape: ShapeLightFocus.RRect,
      radius: 8,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          padding: EdgeInsets.all(0),
          child: Container(
            height: 133,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/guide2.webp'), fit: BoxFit.fitHeight),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => tutorial.next(),
              child: Align(alignment: Alignment(0, -1), child: SizedBox(height: 48)),
            ),
          ),
        ),
      ],
    ),
  );

  tutorial = TutorialCoachMark(
    targets: targets, // List<TargetFocus>
    // colorShadow: Colors.red, // DEFAULT Colors.black
    // opacityShadow = 0.8,
    // alignSkip: Alignment.bottomRight,
    // textSkip: "SKIP",
    // textStyleSkip: const TextStyle(color: Colors.white),
    // skipWidget: MyWidget(),
    hideSkip: true,
    // showSkipInLastTarget: true,
    paddingFocus: 0,
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
    // disableBackButton: false // If true disable native back button.
    onFinish: () {
      storage.showGuide.update(false);
    },
  )..show(context: Get.overlayContext!);
}
