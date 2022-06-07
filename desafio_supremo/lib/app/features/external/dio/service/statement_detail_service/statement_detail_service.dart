import 'package:desafio_supremo/app/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../infra/models/balance_model/balance_model.dart';

part 'statement_detail_service.g.dart';

@RestApi(baseUrl: Api.baseUrl)
abstract class StatementDetailService {
  factory StatementDetailService(Dio dio, {String baseUrl}) =
      _StatementDetailService;

  @GET('${Api.detailStatementEndpoint}/{id}')
  Future<BalanceModel?> getMyBalance(
      @Header(Auth.tokenHeader) String token, @Path() String id);
}
