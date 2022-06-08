import 'package:desafio_supremo/app/features/domain/usecases/my_balance_usecase.dart';
import 'package:desafio_supremo/app/features/infra/models/balance_model/balance_model.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_balance/my_balance_events.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_balance/my_balance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';

class MyBalanceBloc extends Bloc<MyBalanceEvents, MyBalanceState> {
  final MyBalanceUsecase usecase;

  MyBalanceBloc(this.usecase) : super(MyBalanceInitialState()) {
    on<LoadMyBalanceEvents>((event, emit) async =>
        emit(MyBalanceSuccessState(balance: await _getMyBalance())));
  }

  Future<BalanceModel> _getMyBalance() async {
    BalanceModel balanceModel = BalanceModel(amount: 0);
    final result = await usecase();

    return result.fold((l) => balanceModel, (BalanceEntity entity) {
      return BalanceModel.fromEntity(entity);
    });
  }
}
