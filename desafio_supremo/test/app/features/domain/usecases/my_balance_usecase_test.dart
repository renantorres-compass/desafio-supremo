import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/entities/balance_entity.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/repositories/my_balance_repository.dart';
import 'package:desafio_supremo/app/features/domain/usecases/my_balance_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MyBalanceRepositoryMock extends Mock implements MyBalanceRepository {}

class BalanceEntityMock extends Mock implements BalanceEntity {}

void main() {
  final repository = MyBalanceRepositoryMock();
  final usecase = MyBalanceUsecaseImplementation(repository);
  final amount = BalanceEntityMock();

  test('Should return an amount value', () async {
    when(() => repository.getAmountValue())
        .thenAnswer((_) async => Right(amount));
    final result = await usecase();

    expect(result, Right(amount));
    verify(() => repository.getAmountValue()).called(1);
  });

  test('Should return an Server Error when dont succeed', () async {
    when(() => repository.getAmountValue())
        .thenAnswer((_) async => Left(ServerError()));

    final result = await usecase();

    expect(result, Left(ServerError()));
    verify(() => repository.getAmountValue()).called(1);
  });
}
