import 'package:app/shared/balance/balance.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/shared/simple_balance/simple_balance.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/promos/promos_controller.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:flutter/cupertino.dart';
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
          body: ListView.separated(
            padding: EdgeInsets.all(12),
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              return PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(8),
                child: NetworkPicture(
                  imageUrl: 'imageUrl',
                  height: 128,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      titleSpacing: 12,
      automaticallyImplyLeading: false,
      title: SimpleBalance(depositable: false),
      actionsPadding: EdgeInsets.only(right: 12),
      actions: [CustomerService()],
    );
  }
}
