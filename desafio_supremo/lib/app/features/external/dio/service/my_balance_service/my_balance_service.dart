import 'package:desafio_supremo/app/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../infra/models/balance_model/balance_model.dart';

part 'my_balance_service.g.dart';

@RestApi(baseUrl: Api.baseUrl)
abstract class MyBalanceService {
  factory MyBalanceService(Dio dio, {String baseUrl}) = _MyBalanceService;

  @GET(Api.myBalanceEndpoint)
  Future<BalanceModel?> getMyBalance(
    @Header(Auth.tokenHeader) String token,
  );
}
