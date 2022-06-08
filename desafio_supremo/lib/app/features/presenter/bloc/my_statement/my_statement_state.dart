import 'package:equatable/equatable.dart';

import '../../../infra/models/statement_items_model/statement_items_model.dart';

abstract class MyStatementState extends Equatable {
  final StatementItemsModel? statementItems;

  const MyStatementState({required this.statementItems});
}

class MyStatementInitialState extends MyStatementState {
  MyStatementInitialState()
      : super(statementItems: StatementItemsModel(items: []));

  @override
  List<Object?> get props => [];
}

class MyStatementSuccessState extends MyStatementState {
  const MyStatementSuccessState({required super.statementItems});

  @override
  List<Object?> get props => [statementItems];
}

class MyStatementErrorState extends MyStatementState {
  const MyStatementErrorState() : super(statementItems: null);

  @override
  List<Object?> get props => [statementItems];
}
