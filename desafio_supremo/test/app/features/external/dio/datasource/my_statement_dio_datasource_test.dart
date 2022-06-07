import 'package:desafio_supremo/app/core/constants/constants.dart';
import 'package:desafio_supremo/app/features/external/dio/datasource/my_statement_dio_datasource.dart';
import 'package:desafio_supremo/app/features/external/dio/service/my_statement_service/my_statement_service.dart';
import 'package:desafio_supremo/app/features/infra/models/statement_items_model/statement_items_model.dart';
import 'package:desafio_supremo/app/features/infra/models/statement_model/statement_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MyStatementServiceMock extends Mock implements MyStatementService {}

void main() {
  final service = MyStatementServiceMock();
  final datasource = MyStatementDioDatasource(service);

  final list = [
    StatementModel(
        createdAt: 'createdAt',
        id: 'id',
        amount: 1234,
        to: 'to',
        description: 'description',
        tType: 'tType')
  ];

  final items = StatementItemsModel(items: list);

  test('Should return a items list with Statement Model', () async {
    when(() => service.getMyStatement(Auth.tokenValue))
        .thenAnswer((_) async => items);

    final result = await datasource.getMyStatementsList();

    expect(result, items);
    verify(() => service.getMyStatement(Auth.tokenValue)).called(1);
  });

  test('Should return a null value if receives null', () async {
    when(() => service.getMyStatement(Auth.tokenValue))
        .thenAnswer((_) async => null);
    final result = await datasource.getMyStatementsList();
    expect(result, null);
    verify(() => service.getMyStatement(Auth.tokenValue)).called(1);
  });
}
