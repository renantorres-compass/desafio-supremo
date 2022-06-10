import 'package:desafio_supremo/app/features/domain/usecases/detail_statement_usecase.dart';
import 'package:desafio_supremo/app/features/presenter/bloc/detail_statement/detail_statement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../domain/entities/entities.dart';
import '../../../infra/models/detail_statement_model/detail_statement_model.dart';

class DetailStatementBloc
    extends Bloc<DetailStatemenEvents, DetailStatementState> {
  final DetailStatementUsecase usecase;

  DetailStatementBloc(this.usecase) : super(DetailStatementInitialState()) {
    on<LoadDetailStatementsEvents>((event, emit) async => emit(
        DetailStatementSuccessState(
            detailStatement: await _getDetailStatement(event.id))));
  }

  var loadingStatus = LoadingStatus.loading;

  Future<DetailStatementModel?> _getDetailStatement(String id) async {
    loadingStatus = LoadingStatus.loading;
    DetailStatementModel detailStatementModel = DetailStatementModel();
    final result = await usecase(id);

    return result.fold((l) {
      loadingStatus = LoadingStatus.empty;
      return detailStatementModel;
    }, (DetailStatementEntity entity) {
      loadingStatus = LoadingStatus.complete;
      return DetailStatementModel.fromEntity(entity);
    });
  }
}
