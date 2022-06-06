import 'package:equatable/equatable.dart';

abstract class FailureError extends Equatable {}

class ServerError extends FailureError {
  @override
  List<Object?> get props => [];
}
