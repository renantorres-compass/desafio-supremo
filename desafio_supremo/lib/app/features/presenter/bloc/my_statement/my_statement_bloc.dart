import 'package:desafio_supremo/app/features/domain/usecases/my_statement_usecase.dart';
import 'package:desafio_supremo/app/features/infra/models/statement_model/statement_model.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/my_statement/my_statement.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../infra/models/statement_items_model/statement_items_model.dart';

class MyStatementBloc extends Bloc<MyStatementEvents, MyStatementState> {
  final MyStatementUsecase usecase;
  MyStatementBloc(this.usecase) : super(MyStatementInitialState()) {
    on<LoadMyStatementEvents>((event, emit) async => emit(
        MyStatementSuccessState(statementItems: await getMyStatementsList())));
  }

  Future<StatementItemsModel> getMyStatementsList() async {
    final statementItems = StatementItemsModel(items: []);
    final result = await usecase();

    return result.fold((l) => statementItems, (StatementItemsEntity entity) {
      for (var element in entity.items) {
        statementItems.items.add(StatementModel.fromEntity(element));
      }
      return statementItems;
    });
  }
}
