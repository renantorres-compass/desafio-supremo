import 'package:desafio_supremo/app/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      height: 89,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          _customDivider(),
                          _customListTile(appTheme),
                          Flexible(child: Container())
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

Widget _customListTile(ThemeData appTheme) {
  return Flexible(
    flex: 2,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(
              'Transferência enviada',
              style: appTheme.textTheme.bodyText1,
            ),
          ),
          Flexible(
            child: Text(
              'David Bond',
              style: appTheme.textTheme.subtitle1,
            ),
          ),
          Flexible(
            child: Text(
              'R\$ 100,00',
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
