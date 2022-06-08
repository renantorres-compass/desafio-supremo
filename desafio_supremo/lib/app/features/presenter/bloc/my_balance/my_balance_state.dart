import 'package:desafio_supremo/app/features/infra/models/balance_model/balance_model.dart';

abstract class MyBalanceState {
  BalanceModel? balance;

  MyBalanceState({required this.balance});
}

class MyBalanceInitialState extends MyBalanceState {
  MyBalanceInitialState() : super(balance: BalanceModel(amount: 0));
}

class MyBalanceSuccessState extends MyBalanceState {
  MyBalanceSuccessState({required super.balance});
}

class MyBalanceErrorState extends MyBalanceState {
  MyBalanceErrorState() : super(balance: null);
}
