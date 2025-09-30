part of 'lucky_wheel.dart';

class LuckyWheelEnter extends StatefulWidget {
  const LuckyWheelEnter({super.key});

  @override
  _LuckyWheelEnterState createState() => _LuckyWheelEnterState();
}

class _LuckyWheelEnterState extends State<LuckyWheelEnter> {
  LuckyWheelDisplay get display => services.user.luckyWheelDisplay.value;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Offstage(
        offstage: !services.user.luckyWheelDisplay.value.show,
        child: GestureDetector(
          onTap: () {
            if (display.isMiniWaiting) {
              services.user.luckyWheelDisplay.value = LuckyWheelDisplay.waiting;
            } else {
              services.user.luckyWheelDisplay.value = LuckyWheelDisplay.pending;
            }
            VicModals.shared.show(VicModalName.lucky_spin);
          },
          child: Container(
            width: 128 / 2,
            height: 146 / 2,
            alignment: const Alignment(0, 1),
            decoration: const BoxDecoration(
              // color: Colors.yellow,
              image: DecorationImage(
                image: AssetImage('assets/images/lucky_spin_main.webp'),
                alignment: Alignment.topCenter,
              ),
            ),
            child: countdown,
          ),
        ),
      );
    });
  }

  Widget get countdown {
    return SlideCountdown(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      shouldShowDays: (_) => false,
      separator: ':',
      separatorPadding: const EdgeInsets.all(0),
      separatorStyle: const TextStyle(
        fontSize: 11,
        color: Colors.black,
        // letterSpacing: -,
        fontWeight: FontWeight.bold,
      ),
      style: const TextStyle(
        fontSize: 11,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: const Color(0xfffff421),
        border: Border.all(color: const Color(0xff898200), width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      duration: services.user.luckyWheelCountdown.value,
      onDone: () => services.user.queryLuckyWheel(),
    );
  }
}
