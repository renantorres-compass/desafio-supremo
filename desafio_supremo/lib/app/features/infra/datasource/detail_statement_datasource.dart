import 'package:desafio_supremo/app/features/infra/models/detail_statement_model/detail_statement_model.dart';

abstract class DetailStatementDatasource {
  Future<DetailStatementModel?> getDetailStatement(String id);
}
