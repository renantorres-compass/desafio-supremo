import 'package:equatable/equatable.dart';

abstract class ViewAmountEvents extends Equatable {}

class LoadViewAmountEvents extends ViewAmountEvents {
  @override
  List<Object?> get props => [];
}

class ChangeViewAmountEvents extends ViewAmountEvents {
  final bool viewAmount;

  ChangeViewAmountEvents({required this.viewAmount});

  @override
  List<Object?> get props => [viewAmount];
}
