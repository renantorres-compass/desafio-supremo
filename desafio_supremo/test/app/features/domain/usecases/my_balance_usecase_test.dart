import 'package:desafio_supremo/app/features/domain/repositories/my_balance_repository.dart';
import 'package:desafio_supremo/app/features/domain/usecases/my_balance_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MyBalanceRepositoryMock extends Mock implements MyBalanceRepository {}

void main() {
  final repository = MyBalanceRepositoryMock();
  final usecase = MyBalanceUsecaseImplementation(repository);
  test('Should return a amount value', () {});
}
