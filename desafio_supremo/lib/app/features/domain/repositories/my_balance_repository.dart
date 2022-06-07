import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class MyBalanceRepository {
  Future<Either<FailureError, BalanceEntity>> getAmountValue();
}
