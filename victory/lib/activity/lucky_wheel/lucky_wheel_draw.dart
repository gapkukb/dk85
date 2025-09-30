part of 'lucky_wheel.dart';

class _LuckyWheelDraw extends StatefulWidget {
  const _LuckyWheelDraw({super.key});

  @override
  State<_LuckyWheelDraw> createState() => _LuckyWheelDrawState();
}

class _LuckyWheelDrawState extends State<_LuckyWheelDraw> {
  final controller = RouletteController();
  final length = 6;
  var doing = false;
  late final RouletteGroup group;

  @override
  void initState() {
    group = RouletteGroup.uniform(
      length,
      colorBuilder: (index) => Colors.transparent,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return VicModalTemplate(
      padding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      title: 'Free Spin',
      subtitle: 'The more you charge, the more you get',
      buttoText: 'Try Now',
      onCancel: () {
        services.user.luckyWheelDisplay.value = LuckyWheelDisplay.miniWaiting;
      },
      onConfirm: () async {
        if (doing) return;
        doing = true;
        try {
          await services.user.drawLuckyWheel();
          await controller.rollTo(
            Random().nextInt(6),
            clockwise: true,
            offset: random.nextDouble(),
          );
        } finally {
          doing = false;
        }
        // await services.user.queryLuckyWheel();
        services.user.luckyWheelDisplay.value = LuckyWheelDisplay.pending;
      },
      child: Container(
        padding: const EdgeInsets.only(top: 60),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/lucky_spin_bg.webp'), fit: BoxFit.fitWidth, alignment: Alignment(0, -1)),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Roulette(
            backgroundImage: const AssetImage('assets/images/lucky_spin_main.webp'),
            group: group,
            // Provide controller to update its state
            controller: controller,
            // Configure roulette's appearance
            style: const RouletteStyle(
              dividerThickness: 0.0,
              dividerColor: Colors.transparent,
              centerStickSizePercent: 0.0,
              centerStickerColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
