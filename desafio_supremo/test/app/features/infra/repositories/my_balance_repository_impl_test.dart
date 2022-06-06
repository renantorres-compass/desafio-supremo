import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/infra/datasource/my_balance_datasource.dart';
import 'package:desafio_supremo/app/features/infra/models/balance_model.dart';
import 'package:desafio_supremo/app/features/infra/repositories/my_balance_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MyBalanceDatasourceMock extends Mock implements MyBalanceDatasource {}

void main() {
  final datasource = MyBalanceDatasourceMock();
  final repository = MyBalanceRepositoryImpl(datasource);
  var id = faker.guid.guid();
  final amount = BalanceModel(amount: 1234);

  test("Should return a Balance Model", () async {
    when(() => datasource.getAmountValue(id)).thenAnswer((_) async => amount);

    final result = await repository.getAmountValue(id);

    expect(result, Right(amount));
  });

  test("Should return a Datasource Error when dont succeed", () async {
    when(() => datasource.getAmountValue(id))
        .thenThrow((_) async => DatasourceError());

    final result = await repository.getAmountValue(id);

    expect(result, Left(DatasourceError()));
  });
}
