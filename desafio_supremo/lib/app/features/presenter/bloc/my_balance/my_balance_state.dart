import 'package:desafio_supremo/app/features/infra/models/balance_model/balance_model.dart';
import 'package:equatable/equatable.dart';

abstract class MyBalanceState extends Equatable {
  final BalanceModel? balance;

  const MyBalanceState({required this.balance});
}

class MyBalanceInitialState extends MyBalanceState {
  MyBalanceInitialState() : super(balance: BalanceModel(amount: 0));

  @override
  List<Object?> get props => [];
}

class MyBalanceSuccessState extends MyBalanceState {
  const MyBalanceSuccessState({required BalanceModel balance})
      : super(balance: balance);

  @override
  List<Object?> get props => [balance];
}

class MyBalanceErrorState extends MyBalanceState {
  const MyBalanceErrorState() : super(balance: null);

  @override
  List<Object?> get props => [balance];
}
