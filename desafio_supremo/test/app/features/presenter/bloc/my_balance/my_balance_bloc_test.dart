import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_supremo/app/features/infra/models/balance_model/balance_model.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_balance/my_balance_bloc.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_balance/my_balance_events.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_balance/my_balance_state.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

class MyBalanceBlocMock extends MockBloc<MyBalanceEvents, MyBalanceState>
    implements MyBalanceBloc {}

void main() {
  MyBalanceBloc bloc = MyBalanceBlocMock();
  BalanceModel balance =
      BalanceModel(amount: faker.randomGenerator.integer(1000));

  final expectedSuccess = [
    MyBalanceInitialState(),
    MyBalanceSuccessState(balance: balance),
  ];

  final expectedError = [MyBalanceInitialState(), const MyBalanceErrorState()];

  test('Initial state is correct', () async {
    whenListen(bloc, Stream<MyBalanceState>.fromIterable(expectedSuccess),
        initialState: MyBalanceInitialState());
    expect(bloc.state, MyBalanceInitialState());
    bloc.close();
  });

  test('Emits My Balance Success State when succeed', () async {
    whenListen(bloc, Stream<MyBalanceState>.fromIterable(expectedSuccess),
        initialState: MyBalanceInitialState());

    expect(bloc.state, equals(MyBalanceInitialState()));
    bloc.add(LoadMyBalanceEvents());
    expectLater(
        bloc.stream,
        emitsInOrder(
          [
            MyBalanceInitialState(),
            MyBalanceSuccessState(balance: balance),
            emitsDone
          ],
        ));

    bloc.close();
  });

  test('Emits My Balance Error State when dont succeed', () async {
    whenListen(bloc, Stream<MyBalanceState>.fromIterable(expectedError),
        initialState: MyBalanceInitialState());

    expect(bloc.state, equals(MyBalanceInitialState()));
    bloc.add(LoadMyBalanceEvents());
    expectLater(
        bloc.stream,
        emitsInOrder(
          [MyBalanceInitialState(), const MyBalanceErrorState(), emitsDone],
        ));

    bloc.close();
  });
}
