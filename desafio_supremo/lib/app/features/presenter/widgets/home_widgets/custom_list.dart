import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import '../../../../core/utils/utils.dart';
import '../../../infra/models/statement_model/statement_model.dart';
import './home_widgets.dart';

Widget customList(ThemeData appTheme, BuildContext context,
    {required List<StatementModel> list}) {
  return Expanded(
      flex: 3,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            color: Utils.convertToIsPix(list[index].tType)
                ? AppColors.primaryColorLight
                : Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            height: 89,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                _customDivider(),
                customListTile(appTheme,
                    typeAmount: Utils.convertMoneyValueWithType(
                        list[index].amount.toString(), list[index].tType),
                    typeOrigin: list[index].from ?? list[index].to ?? "",
                    typeTitle: list[index].description ?? ""),
                dateWidget(appTheme, context,
                    date: Utils.convertDateToDayMonth(list[index].createdAt),
                    isPix: Utils.convertToIsPix(list[index].tType))
              ],
            ),
          );
        },
      ));
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
