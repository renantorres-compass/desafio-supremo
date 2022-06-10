import 'package:desafio_supremo/app/features/presenter/bloc/my_balance/my_balance.dart';

import 'package:desafio_supremo/app/features/presenter/bloc/my_statement/my_statement_bloc.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_statement/my_statement_events.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_bloc.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/view_amount_bloc/view_amount_events.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/dependency_injection.dart';
import '../widgets/home_widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MyStatementBloc myStatementBloc;
  late MyBalanceBloc myBalanceBloc;
  late ViewAmountBloc viewAmountBloc;

  @override
  void initState() {
    super.initState();

    myStatementBloc = MyStatementBloc(s1());
    myStatementBloc.add(LoadMyStatementEvents());

    myBalanceBloc = MyBalanceBloc(s1());
    myBalanceBloc.add(LoadMyBalanceEvents());

    viewAmountBloc = ViewAmountBloc();
    viewAmountBloc.add(LoadViewAmountEvents());
  }

  @override
  void dispose() {
    myStatementBloc.close();
    myBalanceBloc.close();
    viewAmountBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Flex(
          direction: Axis.vertical,
          children: [
            balanceBlocBuilder(
                appTheme: appTheme,
                myBalanceBloc: myBalanceBloc,
                viewAmountBloc: viewAmountBloc),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 21),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Suas movimentações',
                style: appTheme.textTheme.headline3,
              ),
            ),
            statementBlocBuilder(
                appTheme: appTheme, myStatementBloc: myStatementBloc)
          ],
        ),
      ),
    );
  }
}
