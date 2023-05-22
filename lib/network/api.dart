import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/coin.dart';

@RestApi(baseUrl: "https://api.coinpaprika.com/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/v1/coins")
  Future<List<Coin>> getCoins();

  @GET("/v1/coins/{coinId}")
  Future<Coin> getCoinDetails(@Path("coinId") int coinId);
}

class _RestClient implements RestClient {
  final Dio dio;
  _RestClient(this.dio);

  @override
  Future<List<Coin>> getCoins() async {
    dio.options.baseUrl = 'https://api.coinpaprika.com/';
    dio.options.connectTimeout = 150000;
    final response = await dio.get('v1/coins');
    final List<dynamic> jsonList = response.data;
    final List<Coin> coins =
        jsonList.map((json) => Coin.fromJson(json)).toList();
    return coins;
  }

  @override
  Future<Coin> getCoinDetails(int coinId) async {
    final dio = Dio();
    dio.options.baseUrl = '/v1/coins/{coinId}/v1/coins/{coinId}';
    dio.options.connectTimeout = 150000;
    final response = await dio.get('v1/coins');
    final dynamic jsonList = response.data;
    final Coin coin = jsonList.map((json) => Coin.fromJson(json)).toList();
    return coin;
  }
}
