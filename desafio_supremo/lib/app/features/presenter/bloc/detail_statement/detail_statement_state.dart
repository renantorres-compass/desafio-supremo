import 'package:equatable/equatable.dart';

import '../../../infra/models/detail_statement_model/detail_statement_model.dart';

abstract class DetailStatementState extends Equatable {
  final DetailStatementModel? detailStatement;
  const DetailStatementState({required this.detailStatement});
}

class DetailStatementInitialState extends DetailStatementState {
  const DetailStatementInitialState({required super.detailStatement});

  @override
  List<Object?> get props => [];
}

class DetailStatementSuccessState extends DetailStatementState {
  const DetailStatementSuccessState({required super.detailStatement});

  @override
  List<Object?> get props => [detailStatement];
}

class DetailStatementErrorState extends DetailStatementState {
  const DetailStatementErrorState() : super(detailStatement: null);

  @override
  List<Object?> get props => [detailStatement];
}
