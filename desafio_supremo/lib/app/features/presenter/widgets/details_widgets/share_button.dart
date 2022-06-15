import 'package:desafio_supremo/app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/ui/ui.dart';
import '../../bloc/detail_statement/detail_statement.dart';

class ShareButton extends StatelessWidget {
  const ShareButton(
      {Key? key,
      required this.appTheme,
      required this.screenshotController,
      required this.detailStatementBloc})
      : super(key: key);

  final ThemeData appTheme;
  final ScreenshotController screenshotController;
  final DetailStatementBloc detailStatementBloc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<DetailStatementBloc, DetailStatementState>(
        bloc: detailStatementBloc,
        builder: (context, state) {
          switch (detailStatementBloc.loadingStatus) {
            case LoadingStatus.loading:
            case LoadingStatus.empty:
              return const SizedBox();
            case LoadingStatus.complete:
            default:
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  width: size.width,
                  height: 48,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                  ),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          primary: AppColors.primaryColorLight,
                          backgroundColor: AppColors.primaryColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      onPressed: () async {
                        await Utils.captureImgAndShare(
                            screenshotController, context);
                      },
                      child: Text(
                        'Compartilhar',
                        style: appTheme.textTheme.subtitle2,
                      )),
                ),
              );
          }
        });
  }
}
