import 'package:desafio_supremo/app/features/infra/datasource/my_balance_datasource.dart';
import 'package:desafio_supremo/app/features/infra/models/balance_model/balance_model.dart';

class MyBalanceDioDatasource implements MyBalanceDatasource {
  @override
  Future<BalanceModel> getAmountValue() {
    throw UnimplementedError();
  }
}
