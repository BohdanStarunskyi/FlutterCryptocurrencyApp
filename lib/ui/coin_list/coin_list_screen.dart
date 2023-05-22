import 'package:flutter/material.dart';
import '../coin_details/coin_details_screen.dart';
import 'coin_item.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CoinDetailsScreen(coinId: 1)))
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CoinItem(
                  rank: "1.",
                  name: "Bitcoin",
                  icon: "(BTC)",
                  isActive: true,
                ),
              ),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      ),
    );
  }
}
