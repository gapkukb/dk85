enum AppFlavor { dev, fat, uat, prod }

class Flavor {
  static late final AppFlavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case AppFlavor.dev:
        return 'JJJ2 DEV';
      case AppFlavor.fat:
        return 'JJJ2 FAT';
      case AppFlavor.uat:
        return 'JJJ2 UAT';
      case AppFlavor.prod:
        return 'JJJ2';
    }
  }
}
