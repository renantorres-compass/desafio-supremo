import 'package:desafio_supremo/app/features/infra/models/balance_model/balance_model.dart';

abstract class MyBalanceState {
  BalanceModel? balance;

  MyBalanceState({required this.balance});
}

class InitialMyBalanceState extends MyBalanceState {
  InitialMyBalanceState() : super(balance: BalanceModel(amount: 0));
}

class SuccessMyBalanceState extends MyBalanceState {
  SuccessMyBalanceState({required super.balance});
}

class MyBalanceStateError extends MyBalanceState {
  MyBalanceStateError() : super(balance: null);
}
