import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/infra/datasource/detail_statement_datasource.dart';
import 'package:desafio_supremo/app/features/infra/models/detail_statement_model/detail_statement_model.dart';
import 'package:desafio_supremo/app/features/infra/repositories/detail_statement_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DetailStatementDatasourceMock extends Mock
    implements DetailStatementDatasource {}

void main() {
  final datasource = DetailStatementDatasourceMock();
  final repository = DetailStatementRepositoryImpl(datasource);
  var id = faker.guid.guid();
  final detailStatement = DetailStatementModel(
      amount: 1234,
      id: id,
      authentication: 'authentication',
      tType: 'tType',
      createdAt: 'createdAt',
      to: 'to',
      description: 'description');

  test('Should return Detail Statement Model', () async {
    when(() => datasource.getDetailStatement(id))
        .thenAnswer((_) async => detailStatement);

    final result = await repository.getDetailStatement(id);

    expect(result, Right(detailStatement));
  });

  test("Should return a Datasource Error when dont succeed", () async {
    when(() => datasource.getDetailStatement(id))
        .thenThrow((_) async => DatasourceError());

    final result = await repository.getDetailStatement(id);

    expect(result, Left(DatasourceError()));
  });
}
