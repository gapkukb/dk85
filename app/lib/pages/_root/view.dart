part of 'index.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetRouterOutlet(initialRoute: AppPages.initial, anchorRoute: '/'),
    );
  }
}
