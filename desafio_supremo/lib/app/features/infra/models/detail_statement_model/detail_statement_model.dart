import 'package:desafio_supremo/app/features/domain/entities/detail_statement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_statement_model.g.dart';

@JsonSerializable()
class DetailStatementModel extends DetailStatementEntity {
  DetailStatementModel(
      {super.amount,
      super.id,
      super.authentication,
      super.tType,
      super.createdAt,
      super.to,
      super.description});

  factory DetailStatementModel.fromJson(Map<String, dynamic> json) =>
      _$DetailStatementModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetailStatementModelToJson(this);
}
