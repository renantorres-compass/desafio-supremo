import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_supremo/app/features/infra/models/detail_statement_model/detail_statement_model.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/detail_statement/detail_statement.dart';
import 'package:flutter_test/flutter_test.dart';

class DetailStatementBlocMock
    extends MockBloc<DetailStatemenEvents, DetailStatementState>
    implements DetailStatementBloc {}

void main() {
  final bloc = DetailStatementBlocMock();
  final detailStatementModel = DetailStatementModel();

  final expectedSuccess = [
    DetailStatementInitialState(),
    DetailStatementSuccessState(detailStatement: detailStatementModel),
  ];

  final expectedError = [
    DetailStatementInitialState(),
    const DetailStatementErrorState()
  ];

  const id = "testeID";

  test('Initial state is correct', () async {
    whenListen(
        bloc,
        Stream<DetailStatementState>.fromIterable(
            [DetailStatementInitialState()]),
        initialState: DetailStatementInitialState());
    expect(bloc.state, DetailStatementInitialState());
    bloc.close();
  });

  test('Emits Detail Statement Success State when succeed', () async {
    whenListen(bloc, Stream<DetailStatementState>.fromIterable(expectedSuccess),
        initialState: DetailStatementInitialState());

    expect(bloc.state, equals(DetailStatementInitialState()));
    bloc.add(LoadDetailStatementsEvents(id: id));
    expectLater(
        bloc.stream,
        emitsInOrder(
          [
            DetailStatementInitialState(),
            DetailStatementSuccessState(detailStatement: detailStatementModel),
            emitsDone
          ],
        ));

    bloc.close();
  });

  test('Emits Detail Statement Error State when dont succeed', () async {
    whenListen(bloc, Stream<DetailStatementState>.fromIterable(expectedError),
        initialState: DetailStatementInitialState());

    expect(bloc.state, equals(DetailStatementInitialState()));
    bloc.add(LoadDetailStatementsEvents(id: id));
    expectLater(
        bloc.stream,
        emitsInOrder(
          [
            DetailStatementInitialState(),
            const DetailStatementErrorState(),
            emitsDone
          ],
        ));

    bloc.close();
  });
}
