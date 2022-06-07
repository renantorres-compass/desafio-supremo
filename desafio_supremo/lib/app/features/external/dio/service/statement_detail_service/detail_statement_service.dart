import 'package:desafio_supremo/app/core/constants/constants.dart';
import 'package:desafio_supremo/app/features/infra/models/detail_statement_model/detail_statement_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../infra/models/balance_model/balance_model.dart';

part 'detail_statement_service.g.dart';

@RestApi(baseUrl: Api.baseUrl)
abstract class DetailStatementService {
  factory DetailStatementService(Dio dio, {String baseUrl}) =
      _DetailStatementService;

  @GET('${Api.detailStatementEndpoint}/{id}')
  Future<DetailStatementModel?> getStatementDetail(
      @Header(Auth.tokenHeader) String token, @Path() String id);
}
