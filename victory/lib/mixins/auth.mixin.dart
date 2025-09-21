import '../stores/stores.dart';

mixin AuthMixin {
  onAuth(bool authorized);
  initialize() {
    stores.auth.tokenManager.listen(
      (token) {
        onAuth(token.accessToken == null);
      },
    );
  }
}
