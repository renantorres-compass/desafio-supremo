import 'package:desafio_supremo/app/features/domain/errors/errors.dart';
import 'package:desafio_supremo/app/features/domain/entities/balance_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_supremo/app/features/domain/repositories/my_balance_repository.dart';
import 'package:desafio_supremo/app/features/infra/datasource/my_balance_datasource.dart';

class MyBalanceRepositoryImpl implements MyBalanceRepository {
  final MyBalanceDatasource datasource;

  MyBalanceRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, BalanceEntity>> getAmountValue(String id) async {
    try {
      final result = await datasource.getAmountValue(id);
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
