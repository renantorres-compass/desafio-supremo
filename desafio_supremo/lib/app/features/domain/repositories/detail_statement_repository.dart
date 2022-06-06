import 'package:dartz/dartz.dart';

import '../entities/detail_statement.dart';
import '../errors/errors.dart';

abstract class DetailStatementRepository {
  Future<Either<FailureError, DetailStatementEntity>> getDetailStatement(
      String id);
}
