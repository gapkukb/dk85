class VicBalanceModel {
  VicBalanceModel({
    required this.balance,
    required this.balanceFrozen,
    required this.points,
  });

  final num balance;
  final num balanceFrozen;
  final num points;

  factory VicBalanceModel.fromJson(Map<String, dynamic> json) {
    return VicBalanceModel(
      balance: json["balance"] ?? 0,
      balanceFrozen: json["balance_frozen"] ?? 0,
      points: json["points"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "balance_frozen": balanceFrozen,
    "points": points,
  };

  @override
  String toString() {
    return "$balance, $balanceFrozen, $points, ";
  }
}
