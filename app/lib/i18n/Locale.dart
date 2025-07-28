part of 'index.dart';

class Language {
  final String country;
  final String language;
  final String areaCode;
  final RegExp regExp;
  final String localeName;

  const Language({
    required this.country,
    required this.areaCode,
    required this.language,
    required this.localeName,
    required this.regExp,
  });

  String get code => "${language}_$country";
}

class Languages {
  /// 简体中文
  static final zh_CN = Language(
    country: "CN",
    areaCode: "+86",
    language: "zh",
    localeName: "简体中文",
    regExp: RegExp(r"123"),
  );

  /// 菲律宾英文
  static final en_PH = Language(
    country: "PH",
    areaCode: "+63",
    language: "en",
    localeName: "English",
    regExp: RegExp(r"123"),
  );

  /// 菲律宾语
  static final fil_PH = Language(
    country: "PH",
    areaCode: "+63",
    language: "fil",
    localeName: "Filipino",
    regExp: RegExp(r"123"),
  );

  /// 高棉语
  static final km_KH = Language(
    country: "KH",
    areaCode: "+85",
    language: "km",
    localeName: "ភាសាខ្មែរ",
    regExp: RegExp(r"123"),
  );

  /// 缅甸语
  static final my_MM = Language(
    country: "MM",
    areaCode: "+95",
    language: "my",
    localeName: "မြန်မာဘာသာ",
    regExp: RegExp(r"123"),
  );

  static final selections = [zh_CN, en_PH, fil_PH, km_KH, my_MM];
}
