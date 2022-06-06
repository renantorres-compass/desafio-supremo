import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/entities/statement_entity.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/repositories/my_statement_repository.dart';
import 'package:desafio_supremo/app/features/domain/usecases/my_statement_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MyStatementRepositoryMock extends Mock implements MyStatementRepository {}

class StatementEntityMock extends Mock implements StatementEntity {}

void main() {
  final repository = MyStatementRepositoryMock();
  final usecase = MyStatementUsecaseImpl(repository);
  final list = [StatementEntityMock()];

  test('Should return a list of My Statement Entity', () async {
    when(() => repository.getMyStatementsList())
        .thenAnswer((_) async => Right(list));

    final result = await usecase();
    expect(result, Right(list));
    verify(() => repository.getMyStatementsList()).called(1);
  });

  test('Should return an Server Error when dont succeed', () async {
    when(() => repository.getMyStatementsList())
        .thenAnswer((_) async => Left(ServerError()));

    final result = await usecase();
    expect(result, Left(ServerError()));
    verify(() => repository.getMyStatementsList()).called(1);
  });
}
