library;

import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';

Color amountColor(String amount) {
  return amount.startsWith('-') ? AppColors.danger : AppColors.success;
}
