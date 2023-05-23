import 'package:crypto_app/model/coin.dart';
import 'package:crypto_app/ui/coin_service.dart';
import 'package:flutter/material.dart';
import '../coin_details/coin_details_screen.dart';
import 'coin_item.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Coin>>(
          future: fetchCoins(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final coins = snapshot.data!;
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final coin = coins[index];
                  return GestureDetector(
                      onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CoinDetailsScreen(coinId: coin.id),
                              ),
                            )
                          },
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CoinItem(
                              rank: coin.rank,
                              name: coin.name,
                              icon: coin.symbol,
                              isActive: coin.isActive)));
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Something went wrong",
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      ),
    );
  }
}
