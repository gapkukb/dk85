import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/storage/storage.dart';

mixin VicLocaleMixin {
  static const my = VicLocale('my', 'မြန်မာဘာသာ');
  static const en = VicLocale('en', 'English');
  static const fil = VicLocale('fil', 'Filipino');
  static const _supportedLocales = [my, en, fil];
  static const fallbackLocale = en;

  ///
  final locale = Rx(my);
  List<VicLocale> get supportedLocales => _supportedLocales;
  String get currentLocaleName => locale.value.localeName;
  String get currentLocaleCode => locale.value.languageCode;
  String get _code {
    return storage.locale.value ?? Get.deviceLocale?.languageCode ?? Platform.localeName.split('_').first;
  }

  VicLocale get _current {
    final code = _code.toLowerCase();
    return _codeToLocale(code);
  }

  void updateLocale(VicLocale locale) {
    this.locale.value = locale;
    Get.updateLocale(locale);
    storage.locale.update(locale.languageCode);
  }

  void updateLocaleByCode(String code) {
    updateLocale(_codeToLocale(code));
  }

  void initLocale() {
    final c = _current;
    if (locale.value == c) return;
    updateLocale(c);
  }

  VicLocale _codeToLocale(String code) {
    return _supportedLocales.firstWhere(
      (item) => item.languageCode == code,
      orElse: () => fallbackLocale,
    );
  }
}

class VicLocale extends Locale {
  final String localeName;
  const VicLocale(super.languageCode, this.localeName);
}
