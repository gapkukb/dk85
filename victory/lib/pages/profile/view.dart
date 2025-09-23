import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class VicProfilePage extends StatefulWidget {
  const VicProfilePage({Key? key}) : super(key: key);

  @override
  State<VicProfilePage> createState() => _VicProfilePageState();
}

class _VicProfilePageState extends State<VicProfilePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _ProfileViewGetX();
  }
}

class _ProfileViewGetX extends GetView<VicProfileController> {
  const _ProfileViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ProfilePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicProfileController>(
      init: VicProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("profile")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
