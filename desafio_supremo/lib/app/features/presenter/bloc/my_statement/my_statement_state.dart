import 'package:equatable/equatable.dart';

import '../../../infra/models/statement_items_model/statement_items_model.dart';

abstract class MyStatementState extends Equatable {
  final StatementItemsModel? items;

  const MyStatementState({required this.items});
}

class MyStatementInitialState extends MyStatementState {
  MyStatementInitialState() : super(items: StatementItemsModel(items: []));

  @override
  List<Object?> get props => [];
}

class MyStatementSuccessState extends MyStatementState {
  const MyStatementSuccessState({required super.items});

  @override
  List<Object?> get props => [items];
}

class MyStatementErrorState extends MyStatementState {
  const MyStatementErrorState() : super(items: null);

  @override
  List<Object?> get props => [items];
}
