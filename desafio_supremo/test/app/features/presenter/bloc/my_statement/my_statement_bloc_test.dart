import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_supremo/app/features/infra/models/statement_items_model/statement_items_model.dart';
import 'package:desafio_supremo/app/features/infra/models/statement_model/statement_model.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_statement/my_statement.dart';

import 'package:flutter_test/flutter_test.dart';

class MyStatementBlocMock extends MockBloc<MyStatementEvents, MyStatementState>
    implements MyStatementBloc {}

void main() {
  final bloc = MyStatementBlocMock();
  final list = [
    StatementModel(
        createdAt: 'createdAt',
        id: 'id',
        amount: 1234,
        to: 'to',
        description: 'description',
        tType: 'tType')
  ];
  final statementItems = StatementItemsModel(items: list);
  final expectedSuccess = [
    MyStatementInitialState(),
    MyStatementSuccessState(statementItems: statementItems),
  ];

  final expectedError = [
    MyStatementInitialState(),
    const MyStatementErrorState()
  ];

  test('Initial state is correct', () async {
    whenListen(bloc, Stream<MyStatementState>.fromIterable(expectedSuccess),
        initialState: MyStatementInitialState());
    expect(bloc.state, MyStatementInitialState());
    bloc.close();
  });

  test('Emits My Statement Success State when succeed', () async {
    whenListen(bloc, Stream<MyStatementState>.fromIterable(expectedSuccess),
        initialState: MyStatementInitialState());

    expect(bloc.state, equals(MyStatementInitialState()));
    bloc.add(LoadMyStatementEvents());
    expectLater(
        bloc.stream,
        emitsInOrder(
          [
            MyStatementInitialState(),
            MyStatementSuccessState(statementItems: statementItems),
            emitsDone
          ],
        ));

    bloc.close();
  });

  test('Emits My Statement Error State when dont succeed', () async {
    whenListen(bloc, Stream<MyStatementState>.fromIterable(expectedError),
        initialState: MyStatementInitialState());

    expect(bloc.state, equals(MyStatementInitialState()));
    bloc.add(LoadMyStatementEvents());
    expectLater(
        bloc.stream,
        emitsInOrder(
          [MyStatementInitialState(), const MyStatementErrorState(), emitsDone],
        ));

    bloc.close();
  });
}
