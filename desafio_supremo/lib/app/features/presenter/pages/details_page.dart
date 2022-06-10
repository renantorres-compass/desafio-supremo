import 'package:desafio_supremo/app/features/presenter/bloc/detail_statement/detail_statement.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/detail_statement/detail_statement_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocBuilder<DetailStatementBloc, DetailStatementState>(
                bloc: detailStatementBloc,
                builder: (context, state) {
                  return customDetailsList(appTheme, state.detailStatement!);
                })
          ],
        ),
      ),
    );
  }
}
