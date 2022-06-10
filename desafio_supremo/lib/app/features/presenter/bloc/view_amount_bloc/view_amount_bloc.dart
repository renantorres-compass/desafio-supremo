import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_events.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewAmountBloc extends Bloc<ViewAmountEvents, ViewAmountState> {
  ViewAmountBloc() : super(const ViewAmountInitialState()) {
    on<ViewAmountEvents>((event, emit) async => emit(ViewAmountLoadState(
        viewAmount: await _getSharedPrefViewAmountValue())));

    on<ChangeViewAmountEvents>((event, emit) async => emit(ChangedInitialState(
        viewAmount: await _changeViewAmountValue(event.viewAmount))));
  }
}

Future<bool> _changeViewAmountValue(bool viewAmount) async {
  await _setSharedPrefViewAmountValue(!viewAmount);
  return viewAmount = !viewAmount;
}

Future<bool> _getSharedPrefViewAmountValue() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getBool('viewAmount') != null) {
    return prefs.getBool('viewAmount') ?? true;
  } else {
    prefs.setBool('viewAmount', true);
    return prefs.getBool('viewAmount') ?? true;
  }
}

Future<void> _setSharedPrefViewAmountValue(bool value) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setBool('viewAmount', value);
}
