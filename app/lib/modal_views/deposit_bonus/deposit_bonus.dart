import 'package:app/modal_views/base_modal/base_modal.dart';
import 'package:app/services/index.dart';
import 'package:flutter/material.dart';

class DepositBonusModal extends StatelessWidget {
  const DepositBonusModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      image: 'assets/images/deposit-bonus.webp',
      title: 'Deposit received',
      subtitle: 'Experience the pinnacle of the game',
      buttonText: 'Deposit',
      onPressed: () {
        TabsService.to.toFundsView(0);
      },
      imageHeight: 290,
    );
  }
}
