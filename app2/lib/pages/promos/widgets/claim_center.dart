import 'package:app2/iconfont/index.dart';
import 'package:app2/theme/index.dart';
import 'package:app2/widgets/empty_state.dart';
import 'package:app2/widgets/service_calling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class ClaimCenterWidget extends GetView<PromosController> {
  const ClaimCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("领取中心", style: AppText.title),
                  ServiceCalling(),
                ],
              ),
              Text("优惠金额将直接存入您的账户", style: AppText.label),
              Expanded(
                child: EmptyState(
                  text:
                      "There is no reward available for the moment, go and join in the fun！",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
