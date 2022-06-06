import 'package:desafio_supremo/app/features/infra/models/balance_model.dart';

abstract class MyBalanceDatasource {
  Future<BalanceModel> getAmountValue(String id);
}
