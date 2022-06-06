import 'package:dartz/dartz.dart';

import '../entities/balance_entity.dart';
import '../errors/errors.dart';

abstract class MyBalanceRepository {
  Future<Either<FailureError, BalanceEntity>> getAmountValue(String id);
}
