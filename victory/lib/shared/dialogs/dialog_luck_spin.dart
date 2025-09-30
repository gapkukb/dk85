import 'package:flutter/material.dart';
import 'package:victory/modals/views/modal_action_button.dart';

class DialogLuckSpin extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const DialogLuckSpin({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 571 / 2,
        height: 373 / 2,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/lucky_spin_dialog_bg.webp'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              softWrap: true,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            VicModalActionButton(text: 'Got it', onTap: onTap),
          ],
        ),
      ),
    );
  }
}
