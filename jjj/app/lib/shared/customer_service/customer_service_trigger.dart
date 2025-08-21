part of 'customer_service.dart';

class CustomerServiceTrigger extends StatelessWidget {
  final BoxDecoration? decoration;
  final Widget? child;
  final double size;
  final double iconSize;
  final Color? color;
  final Function(BuildContext context, Widget child)? builder;
  const CustomerServiceTrigger({
    super.key,
    this.child,
    this.color,
    this.size = 24,
    this.decoration,
    this.builder,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _onTap, child: compute(context));
  }

  void _onTap() {
    print("callService");
    // Get.toNamed(Routes.customerService);
  }

  Widget compute(BuildContext context) {
    if (child != null) return AbsorbPointer(child: child);
    final icon = Container(
      alignment: Alignment.center,
      decoration: decoration,
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
