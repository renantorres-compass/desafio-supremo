import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/entities/statement_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/repositories/my_statement_repository.dart';

class MyStatementRepositoryImpl extends MyStatementRepository {
  @override
  Future<Either<FailureError, List<StatementEntity>>> getMyStatementsList() {
    // TODO: implement getMyStatementsList
    throw UnimplementedError();
  }
}
