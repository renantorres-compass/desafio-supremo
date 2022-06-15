import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../../../../core/utils/utils.dart';
import '../../bloc/detail_statement/detail_statement.dart';
import './details_widgets.dart';

class DetailsBlocBuilder extends StatelessWidget {
  const DetailsBlocBuilder(
      {Key? key, required this.detailStatementBloc, required this.appTheme})
      : super(key: key);

  final DetailStatementBloc detailStatementBloc;
  final ThemeData appTheme;

  @override
  Widget build(BuildContext context) {
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
              return CustomDetailsList(
                appTheme: appTheme,
                model: state.detailStatement,
              );
          }
        });
  }
}
