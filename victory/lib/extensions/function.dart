import 'package:victory/services/services.dart';

extension FunctionExt on Function {
  void Function() safely() {
    return () {
      if (services.auth.ensureAuthorized) this();
    };
  }
}
