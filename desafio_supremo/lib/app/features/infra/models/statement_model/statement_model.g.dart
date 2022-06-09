// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementModel _$StatementModelFromJson(Map<String, dynamic> json) =>
    StatementModel(
      createdAt: json['createdAt'] as String?,
      id: json['id'] as String?,
      amount: json['amount'] as num?,
      to: json['to'] as String?,
      description: json['description'] as String?,
      tType: json['tType'] as String?,
      bankName: json['bankName'] as String?,
      from: json['from'] as String?,
    );

Map<String, dynamic> _$StatementModelToJson(StatementModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'amount': instance.amount,
      'to': instance.to,
      'description': instance.description,
      'tType': instance.tType,
      'from': instance.from,
      'bankName': instance.bankName,
    };
