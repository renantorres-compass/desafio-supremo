abstract class DetailStatementEntity {
  final num? amount;
  final String? id;
  final String? authentication;
  final String? tType;
  final String? createdAt;
  final String? to;
  final String? description;
  final String? from;
  final String? bankName;

  DetailStatementEntity({
    this.amount,
    this.id,
    this.authentication,
    this.tType,
    this.createdAt,
    this.to,
    this.description,
    this.from,
    this.bankName,
  });
}
