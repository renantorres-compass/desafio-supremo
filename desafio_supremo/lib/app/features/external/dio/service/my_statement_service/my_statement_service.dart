import 'package:desafio_supremo/app/features/infra/models/statement_items_model/statement_items_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/constants.dart';

part 'my_statement_service.g.dart';

@RestApi(baseUrl: Api.baseUrl)
abstract class MyStatementService {
  factory MyStatementService(Dio dio, {String baseUrl}) = _MyStatementService;

  @GET(Api.myStatementEndpoint)
  Future<StatementItemsModel> getMyStatement(
    @Header(Auth.tokenHeader) String token,
  );
}
