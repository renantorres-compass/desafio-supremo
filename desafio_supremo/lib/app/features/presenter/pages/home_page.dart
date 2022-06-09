import 'package:desafio_supremo/app/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato'),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          _amountWidget(appTheme),
          Flexible(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 21),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Suas movimentações',
              style: appTheme.textTheme.headline3,
            ),
          )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
            ),
          ))
        ],
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
