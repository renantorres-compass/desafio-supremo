import 'package:desafio_supremo/app/features/infra/models/statement_model/statement_model.dart';

abstract class MyStatementDatasource {
  Future<List<StatementModel>?> getMyStatementsList();
}
