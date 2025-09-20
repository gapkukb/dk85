import 'colors.dart';
import "package:flutter/material.dart";

abstract class AppTextStyle {
  // const AppText();

  // 大小
  static const f16 = TextStyle(fontSize: 16);
  static const f14 = TextStyle(fontSize: 14);
  static const f12 = TextStyle(fontSize: 12);
  static const f10 = TextStyle(fontSize: 10);

  // 加粗
  static const bold = TextStyle(fontWeight: FontWeight.bold);

  // 颜色
  final title = const TextStyle(color: AppColor.title);
  final subtitle = const TextStyle(color: AppColor.subtitle);
  final label = const TextStyle(color: AppColor.label);
  final helper = const TextStyle(color: AppColor.description);
  final danger = const TextStyle(color: AppColor.danger);
  final warn = const TextStyle(color: AppColor.warn);
  final success = const TextStyle(color: AppColor.success);

  // 大小+加粗
  static const f16_bold = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const f14_bold = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  static const f12_bold = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  // 大小+颜色
  static const f16_title = TextStyle(color: AppColor.title, fontSize: 16);
  static const f16_subtitle = TextStyle(color: AppColor.subtitle, fontSize: 16);
  static const f16_label = TextStyle(color: AppColor.label, fontSize: 16);
  static const f16_helper = TextStyle(color: AppColor.description, fontSize: 16);
  static const f16_danger = TextStyle(color: AppColor.danger, fontSize: 16);
  static const f16_warn = TextStyle(color: AppColor.warn, fontSize: 16);
  static const f16_success = TextStyle(color: AppColor.success, fontSize: 16);

  // 大小+颜色
  static const f14_title = TextStyle(color: AppColor.title, fontSize: 14);
  static const f14_subtitle = TextStyle(color: AppColor.subtitle, fontSize: 14);
  static const f14_label = TextStyle(color: AppColor.label, fontSize: 14);
  static const f14_helper = TextStyle(color: AppColor.description, fontSize: 14);
  static const f14_danger = TextStyle(color: AppColor.danger, fontSize: 14);
  static const f14_warn = TextStyle(color: AppColor.warn, fontSize: 14);
  static const f14_success = TextStyle(color: AppColor.success, fontSize: 14);

  // 大小+颜色
  static const f12_title = TextStyle(color: AppColor.title, fontSize: 12);
  static const f12_subtitle = TextStyle(color: AppColor.subtitle, fontSize: 12);
  static const f12_label = TextStyle(color: AppColor.label, fontSize: 12);
  static const f12_helper = TextStyle(color: AppColor.description, fontSize: 12);
  static const f12_danger = TextStyle(color: AppColor.danger, fontSize: 12);
  static const f12_warn = TextStyle(color: AppColor.warn, fontSize: 12);
  static const f12_success = TextStyle(color: AppColor.success, fontSize: 12);

  // 大小+颜色
  static const f10_title = TextStyle(color: AppColor.title, fontSize: 10);
  static const f10_subtitle = TextStyle(color: AppColor.subtitle, fontSize: 10);
  static const f10_label = TextStyle(color: AppColor.label, fontSize: 10);
  static const f10_helper = TextStyle(color: AppColor.description, fontSize: 10);
  static const f10_danger = TextStyle(color: AppColor.danger, fontSize: 10);
  static const f10_warn = TextStyle(color: AppColor.warn, fontSize: 10);
  static const f10_success = TextStyle(color: AppColor.success, fontSize: 10);

  // 大小+颜色+加粗
  static const f16_title_bold = TextStyle(color: AppColor.title, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_subtitle_bold = TextStyle(color: AppColor.subtitle, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_label_bold = TextStyle(color: AppColor.label, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_helper_bold = TextStyle(color: AppColor.description, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_danger_bold = TextStyle(color: AppColor.danger, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_warn_bold = TextStyle(color: AppColor.warn, fontSize: 16, fontWeight: FontWeight.bold);
  static const f16_success_bold = TextStyle(color: AppColor.success, fontSize: 16, fontWeight: FontWeight.bold);

  // 大小+颜色+加粗
  static const f14_title_bold = TextStyle(color: AppColor.title, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_subtitle_bold = TextStyle(color: AppColor.subtitle, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_label_bold = TextStyle(color: AppColor.label, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_helper_bold = TextStyle(color: AppColor.description, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_danger_bold = TextStyle(color: AppColor.danger, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_warn_bold = TextStyle(color: AppColor.warn, fontSize: 14, fontWeight: FontWeight.bold);
  static const f14_success_bold = TextStyle(color: AppColor.success, fontSize: 14, fontWeight: FontWeight.bold);

  // 大小+颜色+加粗
  static const f12_title_bold = TextStyle(color: AppColor.title, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_subtitle_bold = TextStyle(color: AppColor.subtitle, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_label_bold = TextStyle(color: AppColor.label, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_helper_bold = TextStyle(color: AppColor.description, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_danger_bold = TextStyle(color: AppColor.danger, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_warn_bold = TextStyle(color: AppColor.warn, fontSize: 12, fontWeight: FontWeight.bold);
  static const f12_success_bold = TextStyle(color: AppColor.success, fontSize: 12, fontWeight: FontWeight.bold);

  // 大小+颜色+加粗
  static const f10_title_bold = TextStyle(color: AppColor.title, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_subtitle_bold = TextStyle(color: AppColor.subtitle, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_label_bold = TextStyle(color: AppColor.label, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_helper_bold = TextStyle(color: AppColor.description, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_danger_bold = TextStyle(color: AppColor.danger, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_warn_bold = TextStyle(color: AppColor.warn, fontSize: 10, fontWeight: FontWeight.bold);
  static const f10_success_bold = TextStyle(color: AppColor.success, fontSize: 10, fontWeight: FontWeight.bold);
}
