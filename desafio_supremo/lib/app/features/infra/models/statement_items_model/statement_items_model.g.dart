// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementItemsModel _$StatementItemsModelFromJson(Map<String, dynamic> json) =>
    StatementItemsModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => StatementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatementItemsModelToJson(
        StatementItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
