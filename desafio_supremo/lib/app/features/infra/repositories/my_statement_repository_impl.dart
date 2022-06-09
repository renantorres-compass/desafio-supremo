import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/entities/statement_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/repositories/my_statement_repository.dart';
import 'package:desafio_supremo/app/features/infra/datasource/my_statement_datasource.dart';

class MyStatementRepositoryImpl extends MyStatementRepository {
  final MyStatementDatasource datasource;

  MyStatementRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, StatementItemsEntity>>
      getMyStatementsList() async {
    try {
      final result = await datasource.getMyStatementsList();
      return Right(result);
    } catch (e) {
      print(e.toString());
      return Left(DatasourceError());
    }
  }
}
