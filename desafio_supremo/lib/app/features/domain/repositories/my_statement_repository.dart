import 'package:dartz/dartz.dart';

import '../entities/statement_entity.dart';
import '../errors/errors.dart';

abstract class MyStatementRepository {
  Future<Either<FailureError, List<StatementEntity>>> getMyStatementsList();
}
