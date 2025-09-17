import 'package:get/get.dart';

part 'app.service.dart';
part 'game.service.dart';
part 'auth.mixin.dart';
part 'user.service.dart';

class _Services {
  late final AuthService auth;
  late final AppService app;
  late final GameService game;
  late final UserService user;

  Future initialize() async {
    auth = AuthService();
    app = AppService();
    game = GameService();
    user = UserService();

    Get.put(auth);
    Get.put(app);
    Get.put(game);
    Get.put(user);

    return Future.wait([auth.initialize(), app.initialize(), game.initialize(), user.initialize()]);
  }
}

final services = _Services();
