import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../../bloc/view_amount_bloc/view_amount.dart';

Widget amountWidget(
    ThemeData appTheme, String amount, ViewAmountBloc viewAmountBloc) {
  return BlocBuilder<ViewAmountBloc, ViewAmountState>(
      bloc: viewAmountBloc,
      builder: (context, state) {
        return state.viewAmount != null
            ? Flexible(
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
                                viewAmountBloc.add(ChangeViewAmountEvents(
                                    viewAmount: state.viewAmount!));
                              },
                              child: state.viewAmount!
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
                        child: state.viewAmount!
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
              ))
            : const SizedBox(
                height: 91,
              );
      });
}
