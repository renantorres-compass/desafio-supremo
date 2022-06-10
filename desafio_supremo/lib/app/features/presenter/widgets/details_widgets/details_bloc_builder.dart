import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../../../../core/utils/utils.dart';
import '../../bloc/detail_statement/detail_statement.dart';
import './details_widgets.dart';

Widget detailsBlocBuilder(
    {required DetailStatementBloc detailStatementBloc,
    required ThemeData appTheme,
    required BuildContext context}) {
  return BlocBuilder<DetailStatementBloc, DetailStatementState>(
      bloc: detailStatementBloc,
      builder: (context, state) {
        switch (detailStatementBloc.loadingStatus) {
          case LoadingStatus.loading:
            return const SizedBox(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColorDark,
                ),
              ),
            );
          case LoadingStatus.empty:
            return const SizedBox();
          case LoadingStatus.complete:
          default:
            return customDetailsList(appTheme, state.detailStatement, context);
        }
      });
}
