part of 'index.dart';

class RecordsFundsDetailView extends GetView<RecordsFundsDetailController> {
  const RecordsFundsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordsFundsDetailController>(
      init: RecordsFundsDetailController(),
      id: "records_funds_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: ListView(
              // padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                const Icon(IconFont.pending, size: 84, color: AppColors.warn),
                const SizedBox(height: 16),
                Text("funds.detail.title".tr, textAlign: TextAlign.center),
                const SizedBox(height: 56),
                ListTile(
                  title: Text("funds.detail.orderNo".tr, style: const TextStyle(fontSize: 12, color: AppColors.title)),
                  contentPadding: const EdgeInsets.only(left: 16, right: 8),
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "2025081313004030076114",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
                      ),
                      Copy(text: "xxxxxxxxxxxx"),
                    ],
                  ),
                ),

                buildItem("funds.detail.amount".tr, "2000"),
                buildItem("funds.detail.receiver".tr, "KBZpay"),
                buildItem("funds.detail.time".tr, "2025-08-13 00:00:00"),
                buildDescription(),
              ],
            ),
          ),
          bottomNavigationBar: MaterialButton(onPressed: () {}, color: AppColors.primary, height: 48, textColor: Colors.white, child: Text("funds.detail.pay".tr)),
        );
      },
    );
  }

  buildItem(String title, String value) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 14, color: AppColors.title)),
      trailing: Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  buildDescription() {
    return Container(
      height: 36,
      alignment: Alignment.center,
      child: Text.rich(
        style: const TextStyle(fontSize: 10),
        TextSpan(
          text: "funds.detail.question".tr,
          children: [
            TextSpan(
              text: "app.service".tr,
              style: const TextStyle(color: AppColors.primary),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle the tap event for the clickable link
                  print('Clickable link tapped!');
                  // You can navigate, open a URL, or perform other actions here.
                },
            ),
          ],
        ),
      ),
    );
  }
}
