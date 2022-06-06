import 'package:desafio_supremo/app/features/domain/entities/statement_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statement_model.g.dart';

@JsonSerializable()
class StatementModel extends StatementEntity {
  StatementModel(
      {required super.createdAt,
      required super.id,
      required super.amount,
      required super.to,
      required super.description,
      required super.tType});

  factory StatementModel.fromJson(Map<String, dynamic> json) =>
      _$StatementModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatementModelToJson(this);
}
