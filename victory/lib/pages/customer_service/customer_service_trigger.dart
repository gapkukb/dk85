part of 'customer_service.dart';

class CustomerService extends StatelessWidget {
  final BoxDecoration decoration;
  final Widget? child;
  final double size;
  final double iconSize;
  final Color? color;
  final bool rounded;

  final Function(BuildContext context, Widget child)? builder;
  const CustomerService({
    super.key,
    this.child,
    this.color,
    this.size = 36,
    this.decoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
    this.builder,
    this.iconSize = 24,
    this.rounded = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: call, child: compute(context));
  }

  static call() {
    Get.toNamed(AppRoutes.customerService);
  }

  Widget compute(BuildContext context) {
    if (child != null) return AbsorbPointer(child: child);
    final deco = decoration.copyWith(
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
