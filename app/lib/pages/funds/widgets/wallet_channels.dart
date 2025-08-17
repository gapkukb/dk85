import '../../../iconfont/index.dart';
import '../../../theme/index.dart';
import '/widgets/network_picture.dart';
import 'package:flutter/material.dart';

class WalletChannels extends StatelessWidget {
  final Function(int index) onTap;
  final bool isWidthrawal;
  const WalletChannels(this.isWidthrawal, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: 2,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        return buidlItem(1);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  buidlItem(int index) {
    return ListTile(
      onTap: () => onTap(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: NetworkPicture(width: 36, height: 36, imageUrl: "https://imgcdn.knryywqf.com/upload/images/202501/34989806-89dd-4b1f-9609-ee0e7541614e.jpg", fit: BoxFit.cover),
      ),
      title: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        isWidthrawal ? "Mrs. Akeem Kshlerin" : "Ms. Piper Wyman",
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(IconFont.arrow_right, size: 22, color: AppColors.primary),
    );
  }
}
