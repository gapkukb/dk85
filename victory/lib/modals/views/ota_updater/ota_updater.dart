import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ota_update/ota_update.dart';
import 'package:victory/shared/app_info/app_info.dart';

class OtaUpdater extends StatelessWidget {
  final progress = RxDouble(0);
  final downloading = false.obs;
  final bool isForce;

  OtaUpdater({super.key, required this.isForce});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: const Alignment(0, -0.2),
          child: Container(
            width: MediaQuery.of(context).size.width - 24,
            padding: const EdgeInsets.only(top: 210),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/ota_update.webp'),
                fit: BoxFit.fitWidth,
                alignment: AlignmentGeometry.topCenter,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Obx(
              () => downloading.value ? progressBar(context) : content,
            ),
          ),
        ),
      ),
    );
  }

  Widget progressBar(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 156,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          // 轨道颜色和高度
          activeTrackColor: Colors.blueAccent,
          inactiveTrackColor: Colors.grey.shade300,
          trackHeight: 6,
          disabledActiveTickMarkColor: Colors.blueAccent,
          disabledInactiveTrackColor: Colors.blueAccent,

          // 滑块样式
          thumbColor: Colors.blueAccent,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),

          // 覆盖滑块拖动时的气泡样式
          showValueIndicator: ShowValueIndicator.alwaysVisible,
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Colors.blueAccent,
          valueIndicatorTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),

          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Obx(
          () => Slider(
            value: progress.value,
            min: 0,
            max: 100,
            divisions: 100,
            label: '${progress.value.toInt()}%',
            onChanged: (_) {},
          ),
        ),
      ),
    );
  }

  Widget get content {
    return Material(
      color: Colors.white,
      shadowColor: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'HI THERE',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'We improves speed and\nperformance, etc.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black45),
          ),

          const SizedBox(height: 24),

          actions,
        ],
      ),
    );
  }

  Widget get actions {
    return SizedBox(
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isForce)
            Expanded(
              child: MaterialButton(
                onPressed: Get.back,
                shape: LinearBorder.top(
                  side: const BorderSide(color: Colors.black12, width: 0.5),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.all(0),
                child: const Text(
                  'Ignore',
                  style: TextStyle(fontSize: 16, color: Color(0xffff7d3f)),
                ),
              ),
            ),
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffff7d3f), Color(0xffff9355)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: MaterialButton(
                onPressed: _update,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.all(0),
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _update() async {
    downloading.value = true;
    try {
      //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
      OtaUpdate()
          .execute(
            'https://pub.imgscache.com/ap-app/arenaplus.apk?shortlink=cew6de3f&pid=H5_DOWNLOAD&af_xp=custom&source_caller=ui&t=${DateTime.now().toIso8601String()}',
            destinationFilename: '${VicAppInfo.shared.packageName}_${DateTime.now().toIso8601String()}.apk',
          )
          .listen((OtaEvent event) {
            if (event.status == OtaStatus.DOWNLOADING) {
              if (event.value == null) return;
              final value = double.tryParse(event.value!);
              if (value != null && value > 0) {
                progress.value = value;
              }
            } else if (event.status != OtaStatus.INSTALLING) {
              downloading.value = false;
            }
          });
    } catch (e) {
      print('Failed to make OTA update. Details: $e');
    } finally {}
  }
}
