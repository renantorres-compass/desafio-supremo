import 'package:desafio_supremo/app/features/infra/models/detail_statement_model/detail_statement_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../bloc/detail_statement/detail_statement.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, this.id}) : super(key: key);

  final String? id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // late DetailStatementBloc detailStatementBloc;

  // @override
  // void initState() {
  //   super.initState();
  //   detailStatementBloc = DetailStatementBloc(s1());
  //   detailStatementBloc.add(LoadDetailStatementsEvents(id: widget.id ?? ""));
  // }

  // @override
  // void dispose() {
  //   detailStatementBloc.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 30,
          padding: EdgeInsets.zero,
          iconSize: 24,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
          ),
        ),
      ),
      body: SizedBox(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 21),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Comprovante',
                style: appTheme.textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customDetailsListTile(
    ThemeData appTheme, String titleType, String textType) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 21),
    alignment: AlignmentDirectional.topStart,
    child: Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Text(
            titleType,
            style: appTheme.textTheme.bodyText1,
          ),
        ),
        Flexible(
          child: Text(
            textType,
            style: appTheme.textTheme.subtitle1,
          ),
        ),
      ],
    ),
  );
}

Widget customDetailsList(ThemeData appTheme, List list) {
  var _titleList = <String>[
    "Tipo de movimentação",
    "Valor",
    "Recebedor",
    "Instituição bancária",
    "Data/Hora",
    "Autenticação"
  ];

  return Expanded(
      flex: 3,
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return customDetailsListTile(
                appTheme, _titleList[index], list[index]);
          }));
}
