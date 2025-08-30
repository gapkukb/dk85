import 'package:app/modal_views/base_modal/base_modal.dart';
import 'package:app/views/gaming/gaming.dart';
import 'package:flutter/material.dart';

class TryGameModal extends StatelessWidget {
  const TryGameModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      image: 'assets/images/try-game.webp',
      title: 'Try this game',
      subtitle: 'Experience the pinnacle of the game',
      buttonText: 'Try game',
      imageHeight: 290,
      onPressed: () {
        // GamingView.play();
      },
    );
  }
}
