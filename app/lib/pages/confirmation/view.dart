part of 'index.dart';

class ConfirmationView extends GetView<ConfirmationController> {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmationController>(
      init: ConfirmationController(),
      id: "confirmation",
      builder: (_) {
        const style = TextStyle(fontSize: 14, color: AppColors.title);
        return Scaffold(
          appBar: AppBar(
            title: Text("payment.receiver.title".tr),
            titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.title),
            actions: const [ServiceCalling(size: 22)],
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                ListTile(
                  titleTextStyle: style,
                  title: Text("payment.receiver".tr),
                  trailing: DecoratedBox(
                    decoration: BoxDecoration(color: const Color(0xffffe6e0), borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 4,
                        children: [
                          const Icon(IconFont.gantanhao, size: 16, color: AppColors.primary),
                          Text("payment.receiver.mark".tr, style: const TextStyle(color: AppColors.primary)),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  titleTextStyle: style,
                  title: Text("payment.receiver.method".tr),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CachedNetworkImage(imageUrl: "https://imgcdn.knryywqf.com/upload/images/202501/34989806-89dd-4b1f-9609-ee0e7541614e.jpg", width: 26, height: 26),
                      const SizedBox(width: 4),
                      const Text("KBZpay"),
                    ],
                  ),
                ),
                ListTile(
                  titleTextStyle: style,
                  title: Text("payment.receiver.No.".tr),
                  trailing: const Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: "2,000.00",
                          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " MMK", style: TextStyle()),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  titleTextStyle: style,
                  title: Text("payment.receiver.amount".tr),
                  trailing: const Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: "2,000.00",
                          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " MMK", style: TextStyle()),
                      ],
                    ),
                  ),
                ),
                buildInput(),
                buildGuide(style),
              ],
            ),
          ),
          bottomNavigationBar: buildButton(),
        );
      },
    );
  }

  buildInput() {
    return buildModule(
      children: [
        SizedBox(
          height: 56,
          child: Align(
            alignment: const Alignment(-1, 0.5),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 14),
                children: [
                  TextSpan(text: "payment.receiver.bill.No.".tr, style: const TextStyle()),
                  TextSpan(
                    text: "(${"app.required".tr})",
                    style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        BaseInput(placeholder: "payment.receiver.placeholder".tr),
      ],
    );
  }

  buildGuide(TextStyle style) {
    return buildModule(
      children: [
        ListTile(titleTextStyle: style, title: Text("payment.receiver.guide".tr)),
        CachedNetworkImage(imageUrl: "https://img.okszckoo.com/upload/images/202502/c18cd50f-1025-48dd-af55-c5d49a819cc5.jpg", width: double.infinity),
      ],
    );
  }

  buildButton() {
    return MaterialButton(onPressed: controller.handleTap, color: AppColors.primary, height: 48, textColor: Colors.white, child: Text("payment.receiver.submit".tr));
  }

  buildModule({required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: children),
    );
  }
}
