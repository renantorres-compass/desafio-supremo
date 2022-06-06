import '../models/balance_model/balance_model.dart';

abstract class MyBalanceDatasource {
  Future<BalanceModel> getAmountValue();
}
