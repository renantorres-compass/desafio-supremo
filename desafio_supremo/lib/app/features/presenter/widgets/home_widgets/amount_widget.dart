import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_bloc.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_events.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';

Widget amountWidget(
    ThemeData appTheme, String amount, ViewAmountBloc viewAmountBloc) {
  return BlocBuilder<ViewAmountBloc, ViewAmountState>(
      bloc: viewAmountBloc,
      builder: (context, state) {
        bool viewAmount = state.viewAmount;
        return Flexible(
            child: Container(
          height: 91,
          color: AppColors.primaryColorLight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 11),
                      child: Text(
                        'Seu saldo',
                        style: appTheme.textTheme.bodyText1,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          viewAmountBloc.add(
                              ChangeViewAmountEvents(viewAmount: viewAmount));
                        },
                        child: viewAmount
                            ? const Icon(
                                Icons.visibility,
                                color: AppColors.primaryColor,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppColors.primaryColor,
                              ))
                  ],
                )),
                Flexible(
                  child: viewAmount
                      ? Text(
                          amount,
                          style: appTheme.textTheme.headline1,
                        )
                      : Text(
                          '_______',
                          style: appTheme.textTheme.headline1,
                        ),
                )
              ],
            ),
          ),
        ));
      });
}
