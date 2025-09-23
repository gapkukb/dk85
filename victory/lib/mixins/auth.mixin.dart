import '../stores/stores.dart';

mixin AuthMixin {
  onAuth(bool authorized);
  ensureInitialized() {
    stores.auth.tokenManager.listen(
      (token) {
        onAuth(token.accessToken == null);
      },
    );
  }
}
