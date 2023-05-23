import 'package:crypto_app/model/coin.dart';
import 'package:crypto_app/model/coin_detail.dart';
import 'package:dio/dio.dart';

import '../network/api.dart';

final dio = Dio(); // Create a Dio instance
final restClient = RestClient(dio); // Create an instance of the RestClient

Future<List<Coin>> fetchCoins() async {
  return restClient.getCoins();
}

Future<CoinDetail> fetchCoinDetails(String id) async {
  return restClient.getCoinDetails(id);
}
