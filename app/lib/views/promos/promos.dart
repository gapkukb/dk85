import 'package:app/dialogs/dialogs.dart';
import 'package:app/iconfont/index.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/shared/simple_user/simple_user.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/promos/promos_controller.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromosView extends StatefulWidget {
  const PromosView({super.key});

  @override
  _PromosViewState createState() => _PromosViewState();
}

class _PromosViewState extends State<PromosView> {
  @override
  Widget build(BuildContext context) {
    return _PromosView();
  }
}

class _PromosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PromosController(),
      builder: (controller) {
        return Scaffold(
          appBar: buildAppBar(),
          body: Obx(() {
            return ListView.separated(
              padding: EdgeInsets.all(12),
              itemCount: controller.promos.length,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final promo = controller.promos[index];
                return GestureDetector(
                  onTap: promo.url.isEmpty ? null : () => Get.toNamed(Routes.activityDetail, arguments: promo.url),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(8),
                    child: NetworkPicture(imageUrl: promo.image, height: 128, fit: BoxFit.cover),
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      titleSpacing: 12,
      automaticallyImplyLeading: false,
      title: const SimpleUser(),
      actionsPadding: EdgeInsets.only(right: 12),
      actions: [
        IconButton(
          onPressed: () {
            Dialogs.to.dailyCheckIn();
            Dialogs.to.show(DialogNames.dailyCheckIn);
          },
          icon: Icon(IconFont.qiandao),
          iconSize: 18,
          color: AppColors.highlight,
        ),
        CustomerService(),
      ],
    );
  }
}
