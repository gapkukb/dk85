import 'package:app/widgets/back_button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AKSingleChildScrollView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool loading;
  const AKSingleChildScrollView({
    super.key,
    required this.title,
    required this.children,
    this.loading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text(title)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              padding: EdgeInsets.all(12),
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
