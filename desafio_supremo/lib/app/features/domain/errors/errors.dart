import 'package:equatable/equatable.dart';

abstract class FailureError extends Equatable {}

class ServerError extends FailureError {
  @override
  List<Object?> get props => [];
}

class InvalidIDError extends FailureError {
  @override
  List<Object?> get props => [];
}

class DatasourceError extends FailureError {
  @override
  List<Object?> get props => [];
}

class NullError extends FailureError {
  @override
  List<Object?> get props => [];
}
