import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/entities/balance_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/repositories/my_balance_repository.dart';

class MyBalanceRepositoryImpl implements MyBalanceRepository {
  @override
  Future<Either<FailureError, BalanceEntity>> getAmountValue(String id) {
    // TODO: implement getAmountValue
    throw UnimplementedError();
  }
}
