import 'package:desafio_supremo/app/features/domain/entities/balance_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance_model.g.dart';

@JsonSerializable()
class BalanceModel extends BalanceEntity {
  BalanceModel({super.amount});

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceModelToJson(this);

  factory BalanceModel.fromEntity(BalanceEntity entity) {
    return BalanceModel(amount: entity.amount);
  }
}
