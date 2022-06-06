import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/repositories/detail_statement_repository.dart';

import '../entities/detail_statement.dart';
import '../errors/errors.dart';

abstract class DetailStatementUsecase {
  Future<Either<FailureError, DetailStatementEntity>> call();
}

class DetailStatementUsecaseImpl implements DetailStatementUsecase {
  final DetailStatementRepository repository;

  DetailStatementUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, DetailStatementEntity>> call() async {
    final result = await repository.getDetailStatement();
    return result;
  }
}
