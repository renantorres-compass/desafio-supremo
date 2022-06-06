import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/entities/balance_entity.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';

abstract class MyBalanceUsecase {
  Future<Either<FailureError, BalanceEntity>> call();
}

class MyBalanceUsecaseImplementation implements MyBalanceUsecase {
  @override
  Future<Either<FailureError, BalanceEntity>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
