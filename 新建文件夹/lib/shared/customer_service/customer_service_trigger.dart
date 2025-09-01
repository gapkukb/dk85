part of 'customer_service.dart';

class CustomerServiceTrigger extends StatelessWidget {
  final BoxDecoration? decoration;
  final Widget? child;
  final double size;
  final double iconSize;
  final Color? color;
  final bool rounded;

  final Function(BuildContext context, Widget child)? builder;
  const CustomerServiceTrigger({
    super.key,
    this.child,
    this.color,
    this.size = 24,
    this.decoration,
    this.builder,
    this.iconSize = 24,
    this.rounded = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: call, child: compute(context));
  }

  static call() {
    Get.toNamed(Routes.customerService);
  }

  Widget compute(BuildContext context) {
    if (child != null) return AbsorbPointer(child: child);
    if (rounded) {
      final a = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      );
    }

    final deco = (decoration ?? BoxDecoration()).copyWith(
      color: Colors.white,
      borderRadius: BorderRadius.circular(100),
    );

    final icon = Container(
      alignment: Alignment.center,
      decoration: deco,
      width: size,
      height: size,
      child: Image.asset(
        "assets/icons/customer-service.webp",
        width: iconSize,
        height: iconSize,
      ),
    );
    if (builder != null) return builder!(context, icon);
    return icon;
  }
}
