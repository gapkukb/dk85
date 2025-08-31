// ignore_for_file: non_constant_identifier_names

part of 'index.dart';

final i18n = I18n();

class I18n extends Translations {
  /// 简体中文
  static final zh_CN = _Locale("zh", "CN", "+86", "简体中文", RegExp(r"123"));

  /// 菲律宾英文
  static final en_US = _Locale("en", "US", "+63", "English", RegExp(r"123"));

  /// 菲律宾语
  static final fil_PH = _Locale("fil", "PH", "+63", "Filipino", RegExp(r"123"));

  /// 高棉语
  static final km_KH = _Locale("km", "KH", "+85", "ភាសាខ្មែរ", RegExp(r"123"));

  /// 缅甸语
  static final my_MM = _Locale("my", "MM", "+95", "မြန်မာဘာသာ", RegExp(r"123"));

  static final supported = [my_MM, en_US, km_KH, fil_PH, zh_CN];

  static final defaultLocale = my_MM;

  static _Locale getLocale(String key) => supported.firstWhere(
    (x) =>
        x.code == key ||
        x.languageCode == key ||
        x.countryCode == key ||
        x.areaCode == key,
    orElse: () => defaultLocale,
  );

  static String getLocaleName(String key) => getLocale(key).localeName;

  static Locale? get locale => Locale(storage.locale.value);

  static const fallbackLocale = Locale('my');

  final Map<String, Map<String, String>> _keys = {
    'en': en,
    'zh': zh,
    'km': km,
    'my': my,
    'fil': fil,
  };

  @override
  Map<String, Map<String, String>> get keys => _keys;

  // Future _load(String code) async {
  //   final content = await rootBundle.loadString("translations/$code.json");
  //   final map = jsonDecode(content);

  //   _keys.clear();
  //   _keys[code] = Map.from(map);
  // }

  // Future loadTranslation(String code) async {
  //   await _load(code);
  //   Future.microtask(reloadApp);
  // }

  // Future initializeTranslation() {
  //   // 检查缓存
  //   var locale = getLocale(Storage.locale.value);
  //   Storage.locale.value = locale.code;
  //   return _load(locale.code);
  // }

  Future updateLocale(String code) async {
    final locale = getLocale(code);
    // await loadTranslation(locale.code);
    storage.locale.update(code);
    // 等待选择框收起动画完成
    await Future.delayed(Durations.medium1);
    Get.updateLocale(locale);
  }

  setup() {
    // Get.updateLocale(Locale(storage.locale.value));
    Get.updateLocale(const Locale("my"));
  }
}

class _Locale extends Locale {
  final String areaCode;
  final RegExp regExp;
  final String localeName;

  const _Locale(
    super.languageCode,
    String super.countryCode,
    this.areaCode,
    this.localeName,
    this.regExp,
  );

  String get code => "$languageCode-$countryCode";
}
