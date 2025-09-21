import 'colors.dart';
import "package:flutter/material.dart";

abstract class AppTextStyles {
  // const AppText();

  // 大小
  static const f16 = const TextStyle(fontSize: 16);
  static const f14 = const TextStyle(fontSize: 14);
  static const f12 = const TextStyle(fontSize: 12);
  static const f10 = const TextStyle(fontSize: 10);

  // 加粗
  static const bold = const TextStyle(fontWeight: FontWeight.bold);

  // 颜色
  static const title = const TextStyle(color: AppColors.title);
  static const subtitle = const TextStyle(color: AppColors.subtitle);
  static const label = const TextStyle(color: AppColors.label);
  static const helper = const TextStyle(color: AppColors.description);
  static const danger = const TextStyle(color: AppColors.danger);
  static const warn = const TextStyle(color: AppColors.warn);
  static const success = const TextStyle(color: AppColors.success);

  // 大小+加粗
  static const f16_bold = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const f14_bold = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  static const f12_bold = const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  // 大小+颜色
  static const f16_title = const TextStyle(color: AppColors.title, fontSize: 16);
  static const f16_subtitle = const TextStyle(color: AppColors.subtitle, fontSize: 16);
  static const f16_label = const TextStyle(color: AppColors.label, fontSize: 16);
  static const f16_helper = const TextStyle(color: AppColors.description, fontSize: 16);
  static const f16_danger = const TextStyle(color: AppColors.danger, fontSize: 16);
  static const f16_warn = const TextStyle(color: AppColors.warn, fontSize: 16);
  static const f16_success = const TextStyle(color: AppColors.success, fontSize: 16);

  // 大小+颜色
  static const f14_title = const TextStyle(color: AppColors.title, fontSize: 14);
  static const f14_subtitle = const TextStyle(color: AppColors.subtitle, fontSize: 14);
  static const f14_label = const TextStyle(color: AppColors.label, fontSize: 14);
  static const f14_helper = const TextStyle(color: AppColors.description, fontSize: 14);
  static const f14_danger = const TextStyle(color: AppColors.danger, fontSize: 14);
  static const f14_warn = const TextStyle(color: AppColors.warn, fontSize: 14);
  static const f14_success = const TextStyle(color: AppColors.success, fontSize: 14);

  // 大小+颜色
  static const f12_title = const TextStyle(color: AppColors.title, fontSize: 12);
  static const f12_subtitle = const TextStyle(color: AppColors.subtitle, fontSize: 12);
  static const f12_label = const TextStyle(color: AppColors.label, fontSize: 12);
  static const f12_helper = const TextStyle(color: AppColors.description, fontSize: 12);
  static const f12_danger = const TextStyle(color: AppColors.danger, fontSize: 12);
  static const f12_warn = const TextStyle(color: AppColors.warn, fontSize: 12);
  static const f12_success = const TextStyle(color: AppColors.success, fontSize: 12);

  // 大小+颜色
  static const f10_title = const TextStyle(color: AppColors.title, fontSize: 10);
  static const f10_subtitle = const TextStyle(color: AppColors.subtitle, fontSize: 10);
  static const f10_label = const TextStyle(color: AppColors.label, fontSize: 10);
  static const f10_helper = const TextStyle(color: AppColors.description, fontSize: 10);
  static const f10_danger = const TextStyle(color: AppColors.danger, fontSize: 10);
  static const f10_warn = const TextStyle(color: AppColors.warn, fontSize: 10);
  static const f10_success = const TextStyle(color: AppColors.success, fontSize: 10);

  // 大小+颜色+加粗
  static const f16_title_bold = const TextStyle(color: AppColors.title, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_subtitle_bold = const TextStyle(color: AppColors.subtitle, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_label_bold = const TextStyle(color: AppColors.label, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_helper_bold = const TextStyle(color: AppColors.description, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_danger_bold = const TextStyle(color: AppColors.danger, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_warn_bold = const TextStyle(color: AppColors.warn, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_success_bold = const TextStyle(color: AppColors.success, fontSize: 16, fontWeight: FontWeight.bold);

  // 大小+颜色+加粗
  static const f14_title_bold = const TextStyle(color: AppColors.title, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_subtitle_bold = const TextStyle(color: AppColors.subtitle, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_label_bold = const TextStyle(color: AppColors.label, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_helper_bold = const TextStyle(color: AppColors.description, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_danger_bold = const TextStyle(color: AppColors.danger, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_warn_bold = const TextStyle(color: AppColors.warn, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_success_bold = const TextStyle(color: AppColors.success, fontSize: 14, fontWeight: FontWeight.bold);

  // 大小+颜色+加粗
  static const f12_title_bold = const TextStyle(color: AppColors.title, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_subtitle_bold = const TextStyle(color: AppColors.subtitle, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_label_bold = const TextStyle(color: AppColors.label, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_helper_bold = const TextStyle(color: AppColors.description, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_danger_bold = const TextStyle(color: AppColors.danger, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_warn_bold = const TextStyle(color: AppColors.warn, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_success_bold = const TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold);

  // 大小+颜色+加粗
  static const f10_title_bold = const TextStyle(color: AppColors.title, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_subtitle_bold = const TextStyle(color: AppColors.subtitle, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_label_bold = const TextStyle(color: AppColors.label, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_helper_bold = const TextStyle(color: AppColors.description, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_danger_bold = const TextStyle(color: AppColors.danger, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_warn_bold = const TextStyle(color: AppColors.warn, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_success_bold = const TextStyle(color: AppColors.success, fontSize: 10, fontWeight: FontWeight.bold);
}
