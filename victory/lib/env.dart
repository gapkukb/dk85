abstract class Environment {
  static const env = String.fromEnvironment('ENV');
  static const bool isDev = env == 'DEV';
  static const bool isFat = env == 'FAT';
  static const bool isUat = env == 'UAT';
  static const bool isProd = env == 'PROD';
  static const bool isNotProd = env != 'PROD';
}

void main(List<String> args) {
  print(DateTime.tryParse(""));
}
