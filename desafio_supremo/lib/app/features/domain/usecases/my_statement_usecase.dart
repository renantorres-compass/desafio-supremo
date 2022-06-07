import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';
import '../repositories/repositories.dart';

abstract class MyStatementUsecase {
  Future<Either<FailureError, StatementItemsEntity>> call();
}

class MyStatementUsecaseImpl implements MyStatementUsecase {
  final MyStatementRepository repository;

  MyStatementUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, StatementItemsEntity>> call() async {
    final result = await repository.getMyStatementsList();
    return result;
  }
}
