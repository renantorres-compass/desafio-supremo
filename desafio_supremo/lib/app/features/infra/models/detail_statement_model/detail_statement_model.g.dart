// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailStatementModel _$DetailStatementModelFromJson(
        Map<String, dynamic> json) =>
    DetailStatementModel(
      amount: json['amount'] as num?,
      id: json['id'] as String?,
      authentication: json['authentication'] as String?,
      tType: json['tType'] as String?,
      createdAt: json['createdAt'] as String?,
      to: json['to'] as String?,
      description: json['description'] as String?,
      bankName: json['bankName'] as String?,
      from: json['from'] as String?,
    );

Map<String, dynamic> _$DetailStatementModelToJson(
        DetailStatementModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'id': instance.id,
      'authentication': instance.authentication,
      'tType': instance.tType,
      'createdAt': instance.createdAt,
      'to': instance.to,
      'description': instance.description,
      'from': instance.from,
      'bankName': instance.bankName,
    };
