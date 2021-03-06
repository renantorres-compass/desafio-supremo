import 'package:desafio_supremo/app/features/presenter/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/ui.dart';
import '../../../../core/utils/utils.dart';
import '../../../infra/models/statement_model/statement_model.dart';
import './home_widgets.dart';

class CustomList extends StatelessWidget {
  const CustomList({Key? key, required this.appTheme, required this.list})
      : super(key: key);

  final ThemeData appTheme;

  final List<StatementModel> list;

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              height: 89.h,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                onPressed: () =>
                    _navigateToDetailsPage(context, list[index].id),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    const CustomDivider(),
                    CustomListTile(
                      appTheme: appTheme,
                      typeAmount: Utils.convertMoneyValueWithType(
                          list[index].amount.toString(), list[index].tType),
                      typeOrigin: list[index].from ?? list[index].to ?? "",
                      typeTitle: list[index].description ?? "",
                    ),
                    DateWidget(
                      date: Utils.convertDateToDayMonth(list[index].createdAt),
                      isPix: Utils.convertToIsPix(list[index].tType),
                      appTheme: appTheme,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

_navigateToDetailsPage(BuildContext context, String? id) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsPage(
                id: id,
              )));
}
