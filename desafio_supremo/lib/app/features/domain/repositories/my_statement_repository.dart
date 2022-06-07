import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class MyStatementRepository {
  Future<Either<FailureError, List<StatementEntity>>> getMyStatementsList();
}
