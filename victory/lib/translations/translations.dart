import 'package:get/get.dart';

part 'zh.dart';
part 'en.dart';
part 'km.dart';
part 'my.dart';
part 'fil.dart';

class VicTranslations extends Translations {
  final Map<String, Map<String, String>> _keys = {'en': _en, 'my': _my, 'km': _km, 'fil': _fil, 'zh': _zh};

  @override
  Map<String, Map<String, String>> get keys => _keys;
}
