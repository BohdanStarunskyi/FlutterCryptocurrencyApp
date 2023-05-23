import 'package:crypto_app/model/coin_detail.dart';
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
  Future<CoinDetail> getCoinDetails(@Path("coinId") String coinId);
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
  Future<CoinDetail> getCoinDetails(String coinId) async {
    dio.options.baseUrl = 'https://api.coinpaprika.com/';
    dio.options.connectTimeout = 150000;
    final response = await dio.get('/v1/coins/$coinId');
    final dynamic json = response.data;
    final CoinDetail coinDetail = CoinDetail.fromJson(json);
    return coinDetail;
  }
}
