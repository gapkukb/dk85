part of 'lottie.dart';

Widget createVicLoading(double size, Color color, int opacity) {
  return Lottie.asset(
    'assets/lottie/loading.lottie',
    width: 72,
    height: 72,
    fit: BoxFit.cover,
    decoder: dotLottieDecoder('c1e4ef8f-0b4a-4e63-9a4e-a2e4ba95665a.json'),
    delegates: LottieDelegates(
      values: [
        ValueDelegate.color(const ['**', 'Layer 1 Outlines', '**'], value: color),
        ValueDelegate.opacity(const ['**', 'Layer 1 Outlines', '**'], value: opacity),
      ],
    ),
  );
}

final vicLoadingIcon = createVicLoading(72, Colors.black, 10);
