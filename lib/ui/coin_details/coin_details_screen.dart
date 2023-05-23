import 'package:crypto_app/model/coin_detail.dart';
import 'package:crypto_app/ui/coin_details/components/tag_chip.dart';
import 'package:crypto_app/ui/coin_details/components/team_member_item.dart';
import 'package:crypto_app/ui/coin_service.dart';
import 'package:flutter/material.dart';

class CoinDetailsScreen extends StatefulWidget {
  const CoinDetailsScreen({
    super.key,
    required this.coinId,
  });
  final String coinId;
  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: SingleChildScrollView(
                child: FutureBuilder<CoinDetail>(
              future: fetchCoinDetails(widget.coinId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final coin = snapshot.data!;
                  String title = "${coin.rank}. ${coin.name} ${coin.symbol}";
                  String description = coin.description;
                  bool isActive = coin.isActive;
                  var stateTextColor = Colors.red;
                  var stateText = "inactive";
                  var tags = coin.tags;
                  var teamMemberss = coin.team;
                  if (isActive) {
                    stateTextColor = Colors.green;
                    stateText = "active";
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 32.0, color: Colors.white),
                          ),
                          Text(
                            stateText,
                            style: TextStyle(
                                fontSize: 32.0, color: stateTextColor),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          description,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const Text(
                        "Tags",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          children: [
                            for (var item in tags) TagChip(name: item),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text(
                          "Team members",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      for (var item in teamMemberss) TeamMemberItem(name: item),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text(
                    "Something went wrong",
                    style: TextStyle(color: Colors.white),
                  ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )),
          ),
        ),
      ),
    );
  }
}
