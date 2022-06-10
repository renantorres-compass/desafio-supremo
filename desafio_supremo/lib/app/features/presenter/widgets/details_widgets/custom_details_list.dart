import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../infra/models/detail_statement_model/detail_statement_model.dart';
import './details_widgets.dart';

Widget customDetailsList(ThemeData appTheme, DetailStatementModel model) {
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
      flex: 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return customDetailsListTile(
                appTheme, titleList[index], list[index]);
          }));
}
