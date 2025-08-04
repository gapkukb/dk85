import 'package:flutter/material.dart';

import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../../ui/button/index.dart';

class SpalashView extends StatefulWidget {
  const SpalashView({super.key});

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<SpalashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        actionsPadding: const EdgeInsets.only(right: 16),
        actions: [
          GestureDetector(
            child: Material(
              borderRadius: BorderRadius.circular(100),
              textStyle: const TextStyle(fontSize: 12, color: Colors.white),
              color: AppColors.danger,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("联系客服"),
                    Icon(IconFont.kefu, color: Colors.white, size: 22),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/spalash.webp"), fit: BoxFit.cover),
        ),
        child: const Text("data"),
      ),
    );
  }
}
