import 'package:desafio_supremo/app/features/presenter/widgets/home_widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../../../../core/utils/utils.dart';
import '../../bloc/my_balance/my_balance.dart';

Widget balanceBlocBuilder(
    {required MyBalanceBloc myBalanceBloc,
    required ThemeData appTheme,
    required bool viewAmount}) {
  return BlocBuilder<MyBalanceBloc, MyBalanceState>(
      bloc: myBalanceBloc,
      builder: (context, state) {
        String amount = state.balance?.amount.toString() ?? "";
        switch (myBalanceBloc.loadingStatus) {
          case LoadingStatus.loading:
            return const SizedBox(
              height: 50,
              child: Center(
                child: LinearProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            );

          case LoadingStatus.empty:
            return amountWidget(
                appTheme, viewAmount, Utils.convertMoneyValue(amount));

          case LoadingStatus.complete:
          default:
            return amountWidget(
                appTheme, viewAmount, Utils.convertMoneyValue(amount));
        }
      });
}
