import 'package:lottie/lottie.dart';

Future<LottieComposition?> Function(List<int>)? dotLottieDecoder(
  String jsonName,
) {
  return (List<int> bytes) {
    return LottieComposition.decodeZip(
      bytes,
      filePicker: (files) {
        return files.firstWhere((f) => f.name == 'animations/$jsonName');
      },
    );
  };
}
