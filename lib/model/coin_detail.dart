class CoinDetail {
  String id;
  bool isActive;
  String name;
  int rank;
  String symbol;
  String description;
  List<String> tags;
  List<String> team;
  CoinDetail({
    required this.id,
    required this.isActive,
    required this.name,
    required this.rank,
    required this.symbol,
    required this.tags,
    required this.team,
    required this.description,
  });

  factory CoinDetail.fromJson(Map<String, dynamic> json) {
    List<dynamic> teamJsonList = json["team"];
    List<String> teamList =
        teamJsonList.map((teamJson) => teamJson["name"] as String).toList();
    List<dynamic> tagsJsonList = json["tags"];
    List<String> tagsList =
        tagsJsonList.map((teamJson) => teamJson["name"] as String).toList();
    return CoinDetail(
      id: json["id"],
      isActive: json["is_active"],
      name: json["name"],
      rank: json["rank"],
      symbol: json["symbol"],
      tags: tagsList,
      team: teamList,
      description: json["description"],
    );
  }
}
