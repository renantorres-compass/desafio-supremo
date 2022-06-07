import 'package:desafio_supremo/app/features/domain/entities/statement_entity.dart';
import 'package:desafio_supremo/app/features/infra/models/statement_model/statement_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statement_items_model.g.dart';

@JsonSerializable()
class StatementItemsModel extends StatementItemsEntity {
  StatementItemsModel({required this.items}) : super(items: items);

  @override
  // ignore: overridden_fields
  final List<StatementModel> items;

  factory StatementItemsModel.fromJson(Map<String, dynamic> json) =>
      _$StatementItemsModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatementItemsModelToJson(this);
}
