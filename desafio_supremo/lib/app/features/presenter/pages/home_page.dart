import 'package:desafio_supremo/app/core/ui/app_colors.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_balance/my_balance_bloc.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_balance/my_balance_events.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_statement/my_statement_bloc.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_statement/my_statement_events.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/dependency_injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MyStatementBloc myStatementBloc;
  late MyBalanceBloc myBalanceBloc;
  bool? isPix;

  @override
  void initState() {
    super.initState();

    myStatementBloc = MyStatementBloc(s1());
    myStatementBloc.add(LoadMyStatementEvents());

    myBalanceBloc = MyBalanceBloc(s1());
    myBalanceBloc.add(LoadMyBalanceEvents());
  }

  @override
  void dispose() {
    myStatementBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    isPix = true;
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
            _amountWidget(appTheme),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 21),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Suas movimentações',
                style: appTheme.textTheme.headline3,
              ),
            ),
            Expanded(
                flex: 3,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      color:
                          isPix! ? AppColors.primaryColorLight : Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      height: 89,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          _customDivider(),
                          _customListTile(appTheme,
                              typeAmount: '1234',
                              typeOrigin: 'David Bond',
                              typeTitle: 'Transferência realizada'),
                          _dateWidget(appTheme, context,
                              date: '09/06', isPix: true)
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

Widget _amountWidget(ThemeData appTheme) {
  return Flexible(
      child: Container(
    height: 91,
    color: AppColors.primaryColorLight,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 11),
                child: Text(
                  'Seu saldo',
                  style: appTheme.textTheme.bodyText1,
                ),
              ),
              const Icon(
                Icons.visibility,
                color: AppColors.primaryColor,
              )
            ],
          )),
          Flexible(
            child: Text(
              'R\$ 1.345,00',
              style: appTheme.textTheme.headline1,
            ),
          )
        ],
      ),
    ),
  ));
}

Widget _customListTile(ThemeData appTheme,
    {required String typeTitle,
    required String typeOrigin,
    required String typeAmount}) {
  return Expanded(
    flex: 3,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(
              typeTitle,
              style: appTheme.textTheme.bodyText1,
            ),
          ),
          Flexible(
            child: Text(
              typeOrigin,
              style: appTheme.textTheme.subtitle1,
            ),
          ),
          Flexible(
            child: Text(
              'R\$ $typeAmount',
              style: appTheme.textTheme.headline3,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _customDivider() {
  return Stack(
    alignment: Alignment.center,
    children: const [
      VerticalDivider(
        thickness: 1,
        color: AppColors.primaryColor,
      ),
      Icon(
        Icons.circle,
        size: 11,
        color: AppColors.primaryColor,
      )
    ],
  );
}

Widget _dateWidget(ThemeData appTheme, BuildContext context,
    {required bool isPix, required String date}) {
  final size = MediaQuery.of(context).size;
  return Flexible(
      child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
    child: isPix
        ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: AppColors.primaryColor,
              height: 19,
              width: size.width,
              alignment: Alignment.center,
              child: Text(
                "Pix",
                style: appTheme.textTheme.subtitle2,
              ),
            ),
            Text(
              date,
              style: appTheme.textTheme.subtitle1,
            ),
          ])
        : Text(
            date,
            style: appTheme.textTheme.subtitle1,
          ),
  ));
}