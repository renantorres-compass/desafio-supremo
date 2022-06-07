import 'package:desafio_supremo/app/core/constants/constants.dart';
import 'package:desafio_supremo/app/features/external/dio/datasource/detail_statement_dio_datasource.dart';
import 'package:desafio_supremo/app/features/external/dio/service/statement_detail_service/detail_statement_service.dart';
import 'package:desafio_supremo/app/features/infra/models/detail_statement_model/detail_statement_model.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DetailStatementServiceMock extends Mock
    implements DetailStatementService {}

void main() {
  final service = DetailStatementServiceMock();
  final datasource = DetailStatementDioDatasource(service);
  final id = faker.guid.guid();
  final detailStatement = DetailStatementModel(
      amount: 1234,
      id: id,
      authentication: 'authentication',
      tType: 'tType',
      createdAt: 'createdAt',
      to: 'to',
      description: 'description');

  test('Should return a Detail Statement model', () async {
    when(() => service.getStatementDetail(Auth.tokenValue, id))
        .thenAnswer((_) async => detailStatement);
    final result = await datasource.getDetailStatement(id);
    expect(result, detailStatement);
    verify(() => service.getStatementDetail(Auth.tokenValue, id)).called(1);
  });
}
