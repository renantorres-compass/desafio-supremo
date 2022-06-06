import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/entities/statement_entity.dart';
import 'package:desafio_supremo/app/features/domain/errors/errors.dart';

abstract class MyStatementUsecase {
  Future<Either<FailureError, List<StatementEntity>>> call();
}
