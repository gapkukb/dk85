import 'package:victory/services/services.dart';

mixin AuthMixin {
  onAuth(bool authorized);
  ensureInitialized() {
    services.auth.tokenManager.listen(
      (token) {
        onAuth(token.accessToken == null);
      },
    );
  }
}
