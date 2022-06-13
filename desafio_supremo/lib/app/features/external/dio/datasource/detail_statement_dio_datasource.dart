import 'package:bot_toast/bot_toast.dart';
import 'package:desafio_supremo/app/features/external/dio/service/statement_detail_service/detail_statement_service.dart';
import 'package:desafio_supremo/app/features/infra/datasource/detail_statement_datasource.dart';
import 'package:desafio_supremo/app/features/infra/models/detail_statement_model/detail_statement_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';

class DetailStatementDioDatasource implements DetailStatementDatasource {
  final DetailStatementService service;

  DetailStatementDioDatasource(this.service);
  @override
  Future<DetailStatementModel?> getDetailStatement(String id) async {
    try {
      final result = await service.getStatementDetail(Auth.tokenValue, id);

      return result;
    } on DioError catch (e) {
      BotToast.showText(text: e.response?.statusMessage ?? "");
      return null;
    }
  }
}
