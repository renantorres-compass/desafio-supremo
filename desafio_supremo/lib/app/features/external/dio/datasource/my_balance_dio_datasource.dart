import 'package:bot_toast/bot_toast.dart';
import 'package:desafio_supremo/app/core/constants/constants.dart';
import 'package:desafio_supremo/app/features/external/dio/service/my_balance_service/my_balance_service.dart';
import 'package:desafio_supremo/app/features/infra/datasource/my_balance_datasource.dart';
import 'package:desafio_supremo/app/features/infra/models/balance_model/balance_model.dart';
import 'package:dio/dio.dart';

class MyBalanceDioDatasource implements MyBalanceDatasource {
  final MyBalanceService service;

  MyBalanceDioDatasource(this.service);
  @override
  Future<BalanceModel?> getAmountValue() async {
    try {
      final result = await service.getMyBalance(Auth.tokenValue);

      return result;
    } on DioError catch (e) {
      BotToast.showText(text: e.response?.statusMessage ?? "");
      return null;
    }
  }
}
