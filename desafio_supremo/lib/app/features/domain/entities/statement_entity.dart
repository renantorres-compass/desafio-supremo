abstract class StatementEntity {
  final String? createdAt;
  final String? id;
  final num? amount;
  final String? to;
  final String? description;
  final String? tType;
  final String? from;
  final String? bankName;

  StatementEntity({
    this.createdAt,
    this.id,
    this.amount,
    this.to,
    this.description,
    this.tType,
    this.from,
    this.bankName,
  });
}

abstract class StatementItemsEntity {
  final List<StatementEntity> items;

  StatementItemsEntity({required this.items});
}
