import '../models/statement_items_model/statement_items_model.dart';

abstract class MyStatementDatasource {
  Future<StatementItemsModel> getMyStatementsList();
}
