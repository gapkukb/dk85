extension SafeCast on Object {
  T? asOrNull<T>() {
    try {
      return this as T;
    } on TypeError {
      return null;
    }
  }

  T asOrElse<T>(T defaultValue) {
    return this is T ? this as T : defaultValue;
  }
}
