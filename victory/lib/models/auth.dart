class AuthModel {
  AuthModel({
    required this.token,
    required this.expiresIn,
  });

  final String token;
  final num expiresIn;

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json["token"] ?? "",
      expiresIn: json["expires_in"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "token": token,
    "expires_in": expiresIn,
  };

  @override
  String toString() {
    return "$token, $expiresIn, ";
  }
}
