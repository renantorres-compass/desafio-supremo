import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
import '../../../infra/models/detail_statement_model/detail_statement_model.dart';
import './details_widgets.dart';

class CustomDetailsList extends StatelessWidget {
  const CustomDetailsList(
      {Key? key, required this.appTheme, required this.model})
      : super(key: key);
  final ThemeData appTheme;
  final DetailStatementModel? model;

  @override
  Widget build(BuildContext context) {
    var titleList = <String>[
      "Tipo de movimentação",
      "Valor",
      "Recebedor",
      "Instituição bancária",
      "Data/Hora",
      "Autenticação"
    ];

    var list = Utils.convertDetailStatementModeltoList(model);
    return Expanded(
        flex: 5,
        child: model != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
                    child: CustomDetailsListTile(
                      appTheme: appTheme,
                      textType: list[index],
                      titleType: titleList[index],
                    ),
                  );
                })
            : const SizedBox());
  }
}
