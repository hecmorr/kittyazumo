import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

class Apis {
  static const String gif = '/cat/gif';
}

@RestApi(baseUrl: "https://cataas.com")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET(Apis.gif)
  Future<List<int>> getGif();
}
