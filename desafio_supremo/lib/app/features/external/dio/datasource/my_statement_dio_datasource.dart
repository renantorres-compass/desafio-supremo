import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';
import '../../../infra/datasource/my_statement_datasource.dart';
import '../../../infra/models/statement_items_model/statement_items_model.dart';
import '../service/my_statement_service/my_statement_service.dart';

class MyStatementDioDatasource implements MyStatementDatasource {
  final MyStatementService service;

  MyStatementDioDatasource(this.service);
  @override
  Future<StatementItemsModel?> getMyStatementsList() async {
    try {
      final result = await service.getMyStatement(Auth.tokenValue);

      return result;
    } on DioError catch (e) {
      return null;
    }
  }
}
