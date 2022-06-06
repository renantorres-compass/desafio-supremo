import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/entities/detail_statement.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/repositories/detail_statement_repository.dart';
import 'package:desafio_supremo/app/features/domain/usecases/detail_statement_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DetailStatementRepositoryMock extends Mock
    implements DetailStatementRepository {}

class DetailStatementEntityMock extends Mock implements DetailStatementEntity {}

void main() {
  final repository = DetailStatementRepositoryMock();
  final usecase = DetailStatementUsecaseImpl(repository);
  final detail = DetailStatementEntityMock();
  var id = faker.guid.guid();

  test('Should return Detail Statement', () async {
    when(() => repository.getDetailStatement(id))
        .thenAnswer((_) async => Right(detail));

    final result = await usecase(id);

    expect(result, Right(detail));
    verify(() => repository.getDetailStatement(id)).called(1);
  });

  test('Should return an Server Error when dont succeed', () async {
    when(() => repository.getDetailStatement(id))
        .thenAnswer((_) async => Left(ServerError()));

    final result = await usecase(id);

    expect(result, Left(ServerError()));
    verify(() => repository.getDetailStatement(id)).called(1);
  });

  test('Should return an Invalid Id Error when input a wrong ID', () async {
    when(() => repository.getDetailStatement(id))
        .thenAnswer((_) async => Left(InvalidIDError()));

    final result = await usecase(id);

    expect(result, Left(InvalidIDError()));
    verify(() => repository.getDetailStatement(id)).called(1);
  });
}
