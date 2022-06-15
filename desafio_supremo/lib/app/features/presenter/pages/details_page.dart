import 'package:desafio_supremo/app/features/presenter/bloc/detail_statement/detail_statement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

import '../../../core/ui/ui.dart';
import '../../../core/utils/utils.dart';
import '../widgets/details_widgets/details_widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, this.id}) : super(key: key);

  final String? id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailStatementBloc detailStatementBloc;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    detailStatementBloc = DetailStatementBloc(s1());
    detailStatementBloc.add(LoadDetailStatementsEvents(id: widget.id ?? ""));
  }

  @override
  void dispose() {
    detailStatementBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 30.r,
          padding: EdgeInsets.zero,
          iconSize: 24.sp,
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24.sp,
          ),
        ),
      ),
      body: Screenshot(
        controller: screenshotController,
        child: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 21.h),
                alignment: AlignmentDirectional.topStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comprovante',
                      style: appTheme.textTheme.headline3,
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: AppColors.textColor,
                    )
                  ],
                ),
              ),
              DetailsBlocBuilder(
                  appTheme: appTheme, detailStatementBloc: detailStatementBloc),
              ShareButton(
                  appTheme: appTheme,
                  screenshotController: screenshotController,
                  detailStatementBloc: detailStatementBloc)
            ],
          ),
        ),
      ),
    );
  }
}
