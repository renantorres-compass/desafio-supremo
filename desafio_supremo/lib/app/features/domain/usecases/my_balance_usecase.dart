import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/entities/balance_entity.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/repositories/my_balance_repository.dart';

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
