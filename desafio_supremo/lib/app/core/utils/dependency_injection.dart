import 'package:desafio_supremo/app/features/domain/repositories/my_balance_repository.dart';
import 'package:desafio_supremo/app/features/domain/usecases/usecases.dart';
import 'package:desafio_supremo/app/features/external/dio/datasource/my_balance_dio_datasource.dart';
import 'package:desafio_supremo/app/features/external/dio/service/my_balance_service/my_balance_service.dart';
import 'package:desafio_supremo/app/features/infra/datasource/my_balance_datasource.dart';
import 'package:desafio_supremo/app/features/infra/repositories/my_balance_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

class DependencyInjection {
  static init() {
    s1.registerSingleton<Dio>(Dio());
    s1.registerSingleton<MyBalanceService>(MyBalanceService(Dio()));
    s1.registerSingleton<MyBalanceDatasource>(MyBalanceDioDatasource(s1()));
    s1.registerSingleton<MyBalanceRepository>(MyBalanceRepositoryImpl(s1()));
    s1.registerSingleton<MyBalanceUsecase>(
        MyBalanceUsecaseImplementation(s1()));
  }
}
