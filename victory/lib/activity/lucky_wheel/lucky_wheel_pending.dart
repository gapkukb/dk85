part of 'lucky_wheel.dart';

class _LuckyWheelPending extends StatefulWidget {
  const _LuckyWheelPending({super.key});

  @override
  State<_LuckyWheelPending> createState() => _LuckyWheelPendingState();
}

class _LuckyWheelPendingState extends State<_LuckyWheelPending> {
  var doing = false;
  double prizeAmount = 0.0;
  bool get pending => prizeAmount == 0.0;
  @override
  Widget build(BuildContext context) {
    return VicModalTemplate(
      padding: const EdgeInsets.all(0),
      margin: 0,
      backgroundColor: Colors.transparent,
      title: 'Congratulations',
      // subtitle: 'The more you charge, the more you get',
      buttoText: pending ? 'Got it' : 'Close',
      onConfirm: () async {
        if (doing) return;
        if (pending) {
          doing = true;
          try {
            prizeAmount = await services.user.cliamLuckyWheel();
            setState(() {});
          } finally {
            doing = false;
          }
        } else {
          services.user.finishLuckyWheel();
          Get.back();
        }
      },
      onCancel: () async {
        if (pending) {
          services.user.luckyWheelDisplay.value = LuckyWheelDisplay.miniPending;
        } else {
          services.user.finishLuckyWheel();
          Get.back();
        }
      },
      child: Container(
        alignment: const Alignment(0, 0.1),
        width: double.infinity,
        height: 360,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fu_dai.webp'),
            scale: 1.9,
          ),
        ),
        foregroundDecoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/jin_bi.webp'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: prizeAmount == 0.0
            ? const Text(
                "Congratulations",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              )
            : Text(
                prizeAmount.compact(),
                style: const TextStyle(fontSize: 48, color: Color(0xfffff957), fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
