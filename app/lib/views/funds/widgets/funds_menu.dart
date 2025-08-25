import 'package:get/get.dart';
import '/theme/index.dart';
import 'package:flutter/cupertino.dart';

class FundsMenu extends StatelessWidget {
  final IconData iconName;
  final String name;
  final String to;
  const FundsMenu(this.iconName, this.name, {super.key, required this.to});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(to);
      },
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3, color: Color(0xffffae83)),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              gradient: RadialGradient(
                colors: [Color(0xffFFECE2), Color(0xffFFCBAF)],
                center: Alignment(0, -1.2),
                radius: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(iconName, color: AppColors.primary, size: 30),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1,
              fontWeight: FontWeight.w100,
              color: AppColors.label,
            ),
          ),
        ],
      ),
    );
  }
}

// radial-gradient(91.65% 64.13% at 48.96% 0%, #FFECE2 0%, #FFCBAF 100%)
