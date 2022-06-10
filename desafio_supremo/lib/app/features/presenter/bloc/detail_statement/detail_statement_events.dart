import 'package:equatable/equatable.dart';

abstract class DetailStatemenEvents extends Equatable {}

class LoadDetailStatementsEvents extends DetailStatemenEvents {
  final String id;

  LoadDetailStatementsEvents({required this.id});

  @override
  List<Object?> get props => [id];
}
