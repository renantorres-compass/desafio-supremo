import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/infra/datasource/my_statement_datasource.dart';
import 'package:desafio_supremo/app/features/infra/models/statement_items_model/statement_items_model.dart';
import 'package:desafio_supremo/app/features/infra/models/statement_model/statement_model.dart';
import 'package:desafio_supremo/app/features/infra/repositories/my_statement_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MyStatementDatasourceMock extends Mock implements MyStatementDatasource {}

void main() {
  final datasource = MyStatementDatasourceMock();
  final repository = MyStatementRepositoryImpl(datasource);
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

  test('Should return a My Statement Model list', () async {
    when(() => datasource.getMyStatementsList()).thenAnswer((_) async => items);

    final result = await repository.getMyStatementsList();

    expect(result, Right(items));
    verify(() => datasource.getMyStatementsList()).called(1);
  });

  test('Should throw a Datasource Error if dont succeed', () async {
    when(() => datasource.getMyStatementsList())
        .thenThrow((_) async => DatasourceError());

    final result = await repository.getMyStatementsList();

    expect(result, Left(DatasourceError()));
    verify(() => datasource.getMyStatementsList()).called(1);
  });
}
