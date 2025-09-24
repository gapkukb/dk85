import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../components/back_button/back_button.dart';

class VicStateScrollView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool loading;
  const VicStateScrollView({
    super.key,
    required this.title,
    required this.children,
    this.loading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const VicBackButton(), title: Text(title)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Skeletonizer(
                enabled: loading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
