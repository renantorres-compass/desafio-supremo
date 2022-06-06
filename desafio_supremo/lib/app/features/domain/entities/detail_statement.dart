abstract class DetailStatementEntity {
  final num amount;
  final String id;
  final String authentication;
  final String tType;
  final String createdAt;
  final String to;
  final String description;

  DetailStatementEntity(
      {required this.amount,
      required this.id,
      required this.authentication,
      required this.tType,
      required this.createdAt,
      required this.to,
      required this.description});
}
