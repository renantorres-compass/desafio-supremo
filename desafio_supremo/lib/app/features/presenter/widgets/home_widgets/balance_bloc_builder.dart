import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../bloc/my_balance/my_balance.dart';
import '../../bloc/view_amount_bloc/view_amount.dart';
import '../widgets.dart';

class BalanceBlocBuilder extends StatelessWidget {
  const BalanceBlocBuilder(
      {Key? key,
      required this.myBalanceBloc,
      required this.appTheme,
      required this.viewAmountBloc})
      : super(key: key);

  final MyBalanceBloc myBalanceBloc;
  final ThemeData appTheme;
  final ViewAmountBloc viewAmountBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBalanceBloc, MyBalanceState>(
        bloc: myBalanceBloc,
        builder: (context, state) {
          String amount = state.balance?.amount.toString() ?? "";
          switch (myBalanceBloc.loadingStatus) {
            case LoadingStatus.loading:
              return const CustomLinearProgress();

            case LoadingStatus.empty:
            case LoadingStatus.complete:
            default:
              return AmountWidget(
                amount: Utils.convertMoneyValue(amount),
                appTheme: appTheme,
                viewAmountBloc: viewAmountBloc,
              );
          }
        });
  }
}
