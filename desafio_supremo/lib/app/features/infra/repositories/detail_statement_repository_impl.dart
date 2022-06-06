import 'package:desafio_supremo/app/features/domain/errors/errors.dart';

import 'package:desafio_supremo/app/features/domain/entities/detail_statement.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/detail_statement_repository.dart';

class DetailStatementRepositoryImpl extends DetailStatementRepository {
  @override
  Future<Either<FailureError, DetailStatementEntity>> getDetailStatement() {
    // TODO: implement getDetailStatement
    throw UnimplementedError();
  }
}
