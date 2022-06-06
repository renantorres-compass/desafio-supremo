abstract class StatementEntity {
  final String createdAt;
  final String id;
  final num amount;
  final String to;
  final String description;
  final String tType;

  StatementEntity(
      {required this.createdAt,
      required this.id,
      required this.amount,
      required this.to,
      required this.description,
      required this.tType});
}
