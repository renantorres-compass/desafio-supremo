import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/entities/detail_statement.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/repositories/detail_statement_repository.dart';
import 'package:desafio_supremo/app/features/domain/usecases/detail_statement_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DetailStatementRepositoryMock extends Mock
    implements DetailStatementRepository {}

class DetailStatementEntityMock extends Mock implements DetailStatementEntity {}

void main() {
  final repository = DetailStatementRepositoryMock();
  final usecase = DetailStatementUsecaseImpl(repository);
  final detail = DetailStatementEntityMock();

  test('Should return Detail Statement', () async {
    when(() => repository.getDetailStatement())
        .thenAnswer((_) async => Right(detail));

    final result = await usecase();

    expect(result, Right(detail));
    verify(() => repository.getDetailStatement()).called(1);
  });

  test('Should return an Server Error when dont succeed', () async {
    when(() => repository.getDetailStatement())
        .thenAnswer((_) async => Left(ServerError()));

    final result = await usecase();

    expect(result, Left(ServerError()));
    verify(() => repository.getDetailStatement()).called(1);
  });
}
