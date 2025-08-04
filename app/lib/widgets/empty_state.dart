import '../theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmptyStateType {
  NO_DATA("Bill_empty.webp");

  const EmptyStateType(this.assetName);

  final String assetName;

  String get asset => "assets/images/empty-state/$assetName";
}

class EmptyState extends StatelessWidget {
  final EmptyStateType type;
  final double spacing;
  final String? text;
  final String? buttonText;
  final VoidCallback? onButtonTap;

  const EmptyState({
    super.key,
    this.type = EmptyStateType.NO_DATA,
    this.spacing = 32,
    this.text,
    this.buttonText,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: [
              Image.asset(type.asset, width: 128),
              if (text != null)
                Text(text!, style: AppText.label, textAlign: TextAlign.center),
              if (buttonText != null)
                SizedBox(
                  width: constraints.maxWidth,
                  child: CupertinoButton(
                    sizeStyle: CupertinoButtonSize.medium,
                    borderRadius: BorderRadius.circular(4),
                    onPressed: onButtonTap,
                    color: Colors.red,
                    child: Text(
                      buttonText!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
