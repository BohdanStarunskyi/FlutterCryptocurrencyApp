class Coin {
  String id;
  bool isActive;
  String name;
  String rank;
  String symbol;

  Coin({
    required this.id,
    required this.isActive,
    required this.name,
    required this.rank,
    required this.symbol,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        id: json["id"],
        isActive: json["is_active"],
        name: json["name"],
        rank: json["rank"].toString(),
        symbol: json["symbol"]);
  }
}
