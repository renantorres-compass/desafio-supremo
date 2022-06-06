import 'package:desafio_supremo/app/features/domain/errors/errors.dart';

import 'package:desafio_supremo/app/features/domain/entities/detail_statement.dart';

import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/infra/datasource/detail_statement_datasource.dart';

import '../../domain/repositories/detail_statement_repository.dart';

class DetailStatementRepositoryImpl extends DetailStatementRepository {
  final DetailStatementDatasource datasource;

  DetailStatementRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, DetailStatementEntity>> getDetailStatement(
      String id) async {
    try {
      final result = await datasource.getDetailStatement(id);
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
