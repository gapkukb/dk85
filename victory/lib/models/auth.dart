part of models;

class VicAuthModel extends VicBaseModel {
  const VicAuthModel({
    required this.token,
    required this.expiresIn,
  });

  final String token;
  final num expiresIn;

  factory VicAuthModel.fromJson(Map<String, dynamic> json) {
    return VicAuthModel(
      token: json["token"] ?? "",
      expiresIn: json["expires_in"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "token": token,
    "expires_in": expiresIn,
  };
}

void main(List<String> args) {}
