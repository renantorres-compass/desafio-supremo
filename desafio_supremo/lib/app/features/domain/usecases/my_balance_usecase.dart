import 'package:dartz/dartz.dart';

import '../entities/balance_entity.dart';
import '../errors/errors.dart';
import '../repositories/my_balance_repository.dart';

abstract class MyBalanceUsecase {
  Future<Either<FailureError, BalanceEntity>> call(String id);
}

class MyBalanceUsecaseImplementation implements MyBalanceUsecase {
  final MyBalanceRepository repository;

  MyBalanceUsecaseImplementation(this.repository);
  @override
  Future<Either<FailureError, BalanceEntity>> call(String id) async {
    final result = await repository.getAmountValue(id);
    return result;
  }
}
