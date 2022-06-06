import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/infra/datasource/my_statement_datasource.dart';
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

  test('Should return a My Statement Model list', () async {
    when(() => datasource.getMyStatementsList()).thenAnswer((_) async => list);

    final result = await repository.getMyStatementsList();

    expect(result, Right(list));
    verify(() => datasource.getMyStatementsList()).called(1);
  });
}
