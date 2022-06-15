import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../../../../core/utils/utils.dart';
import '../../../infra/models/statement_model/statement_model.dart';
import '../../bloc/my_statement/my_statement.dart';
import './home_widgets.dart';

class StatementBlocBuilder extends StatelessWidget {
  const StatementBlocBuilder(
      {Key? key, required this.myStatementBloc, required this.appTheme})
      : super(key: key);

  final MyStatementBloc myStatementBloc;
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
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

              return CustomList(appTheme: appTheme, list: list);
          }
        });
  }
}
