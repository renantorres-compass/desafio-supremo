import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/ui.dart';
import '../../bloc/view_amount_bloc/view_amount.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget(
      {Key? key,
      required this.appTheme,
      required this.amount,
      required this.viewAmountBloc})
      : super(key: key);

  final ThemeData appTheme;
  final String amount;
  final ViewAmountBloc viewAmountBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAmountBloc, ViewAmountState>(
        bloc: viewAmountBloc,
        builder: (context, state) {
          return state.viewAmount != null
              ? Flexible(
                  child: Container(
                  height: 91.h,
                  color: AppColors.primaryColorLight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
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
                              padding: EdgeInsets.only(right: 11.w),
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
                                    ? Icon(
                                        Icons.visibility,
                                        size: 24.sp,
                                        color: AppColors.primaryColor,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        size: 24.sp,
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
              : SizedBox(
                  height: 91.h,
                );
        });
  }
}
