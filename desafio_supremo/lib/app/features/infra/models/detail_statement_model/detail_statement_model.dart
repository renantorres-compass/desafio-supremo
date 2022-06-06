import 'package:desafio_supremo/app/features/domain/entities/detail_statement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_statement_model.g.dart';

@JsonSerializable()
class DetailStatementModel extends DetailStatementEntity {
  DetailStatementModel(
      {required super.amount,
      required super.id,
      required super.authentication,
      required super.tType,
      required super.createdAt,
      required super.to,
      required super.description});

  factory DetailStatementModel.fromJson(Map<String, dynamic> json) =>
      _$DetailStatementModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetailStatementModelToJson(this);
}
