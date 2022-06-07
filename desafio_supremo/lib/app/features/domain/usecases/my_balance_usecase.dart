import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

abstract class MyBalanceUsecase {
  Future<Either<FailureError, BalanceEntity>> call();
}

class MyBalanceUsecaseImplementation implements MyBalanceUsecase {
  final MyBalanceRepository repository;

  MyBalanceUsecaseImplementation(this.repository);
  @override
  Future<Either<FailureError, BalanceEntity>> call() async {
    final result = await repository.getAmountValue();
    return result;
  }
}
