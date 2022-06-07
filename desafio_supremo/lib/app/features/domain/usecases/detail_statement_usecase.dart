import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

abstract class DetailStatementUsecase {
  Future<Either<FailureError, DetailStatementEntity>> call(String id);
}

class DetailStatementUsecaseImpl implements DetailStatementUsecase {
  final DetailStatementRepository repository;

  DetailStatementUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, DetailStatementEntity>> call(String id) async {
    final result = await repository.getDetailStatement(id);
    return result;
  }
}
