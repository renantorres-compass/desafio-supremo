import 'package:desafio_supremo/app/features/presenter/widgets/home_widgets/home_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../../../../core/utils/utils.dart';
import '../../../infra/models/statement_model/statement_model.dart';
import '../../bloc/my_statement/my_statement.dart';

Widget statementBlocBuilder(
    {required MyStatementBloc myStatementBloc, required ThemeData appTheme}) {
  return BlocBuilder<MyStatementBloc, MyStatementState>(
      bloc: myStatementBloc,
      builder: (context, state) {
        switch (myStatementBloc.loadingStatus) {
          case LoadingStatus.loading:
            return const SizedBox(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            );

          case LoadingStatus.empty:
            return const SizedBox();
          case LoadingStatus.complete:
          default:
            List<StatementModel> list = state.statementItems?.items ?? [];

            return customList(appTheme, context, list: list);
        }
      });
}
