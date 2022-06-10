import 'package:desafio_supremo/app/features/presenter/bloc/detail_statement/detail_statement.dart';
import 'package:flutter/material.dart';

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
        height: size.height,
        width: size.width,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 21),
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
            detailsBlocBuilder(
                appTheme: appTheme,
                context: context,
                detailStatementBloc: detailStatementBloc),
            shareDetailsButton(
              appTheme: appTheme,
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
