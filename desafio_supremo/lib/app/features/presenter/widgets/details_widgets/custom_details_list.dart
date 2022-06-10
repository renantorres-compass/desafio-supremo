import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../infra/models/detail_statement_model/detail_statement_model.dart';
import './details_widgets.dart';

Widget customDetailsList(
    ThemeData appTheme, DetailStatementModel? model, BuildContext context) {
  var titleList = <String>[
    "Tipo de movimentação",
    "Valor",
    "Recebedor",
    "Instituição bancária",
    "Data/Hora",
    "Autenticação"
  ];

  var list =
      model != null ? Utils.convertDetailStatementModeltoList(model) : [];

  return Expanded(
      flex: 5,
      child: model != null
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                  child: customDetailsListTile(
                      appTheme, titleList[index], list[index], context),
                );
              })
          : const SizedBox());
}
