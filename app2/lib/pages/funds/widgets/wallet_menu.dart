import '/iconfont/index.dart';
import '/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletMenu extends StatelessWidget {
  final IconData iconName;
  final String name;
  const WalletMenu(this.iconName, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(0),
      sizeStyle: CupertinoButtonSize.medium,
      onPressed: () {},
      child: Column(
        children: [
          PhysicalModel(
            color: Color(0xfffff7f5),
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(iconName, color: AppColors.danger, size: 24),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(fontSize: 12, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
