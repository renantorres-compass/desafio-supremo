import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_events.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAmountBloc extends Bloc<ViewAmountEvents, ViewAmountState> {
  ViewAmountBloc() : super(ViewAmountInitialState(viewAmount: true)) {
    on<ViewAmountEvents>(
        (event, emit) => emit(ViewAmountInitialState(viewAmount: true)));

    on<ChangeViewAmountEvents>((event, emit) => emit(ChangedInitialState(
        viewAmount: _changeViewAmountValue(event.viewAmount))));
  }
}

bool _changeViewAmountValue(bool viewAmount) {
  return viewAmount = !viewAmount;
}
