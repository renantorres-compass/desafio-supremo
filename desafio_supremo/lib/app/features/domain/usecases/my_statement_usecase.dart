import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/entities/statement_entity.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/repositories/my_statement_repository.dart';

abstract class MyStatementUsecase {
  Future<Either<FailureError, List<StatementEntity>>> call();
}

class MyStatementUsecaseImpl implements MyStatementUsecase {
  final MyStatementRepository repository;

  MyStatementUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<StatementEntity>>> call() async {
    final result = await repository.getMyStatementsList();
    return result;
  }
}
