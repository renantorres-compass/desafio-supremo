import 'package:desafio_supremo/app/core/constants/auth.dart';
import 'package:desafio_supremo/app/features/external/dio/datasource/my_balance_dio_datasource.dart';
import 'package:desafio_supremo/app/features/external/dio/service/my_balance_service/my_balance_service.dart';
import 'package:desafio_supremo/app/features/infra/models/balance_model/balance_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MyBalanceServiceMock extends Mock implements MyBalanceService {}

void main() {
  final service = MyBalanceServiceMock();
  final datasource = MyBalanceDioDatasource(service);
  final myBalance = BalanceModel(amount: 1234);

  test('Should return a My Balance model', () async {
    when(() => service.getMyBalance(Auth.tokenValue))
        .thenAnswer((_) async => myBalance);
    final result = await datasource.getAmountValue();
    expect(result, myBalance);
    verify(() => service.getMyBalance(Auth.tokenValue)).called(1);
  });
}
