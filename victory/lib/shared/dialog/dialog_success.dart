part of 'dialog.dart';

class _VicDialogSuccess extends StatelessWidget {
  final String? text;
  final Widget? widget;
  final VoidCallback? onClose;
  const _VicDialogSuccess({
    Key? key,
    this.text,
    this.widget,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Lottie.asset(
        'assets/lottie/success.lottie',
        repeat: false,
        width: 96,
        height: 96,
        fit: BoxFit.cover,
        decoder: dotLottieDecoder(
          '0156028b-256d-4785-b700-db3838aa6380.json',
        ),
        onLoaded: (composition) async {
          await Future.delayed(composition.duration);
          onClose?.call();
        },
      ),
    ];

    if (widget != null) {
      children.add(widget!);
    } else {
      children.add(
        Text(
          text ?? 'Opration Successful',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
