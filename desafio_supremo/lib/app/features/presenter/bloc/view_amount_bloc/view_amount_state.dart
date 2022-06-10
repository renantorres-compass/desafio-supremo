import 'package:equatable/equatable.dart';

abstract class ViewAmountState extends Equatable {
  final bool viewAmount;

  const ViewAmountState({required this.viewAmount});
}

class ViewAmountInitialState extends ViewAmountState {
  const ViewAmountInitialState({required super.viewAmount});

  @override
  List<Object?> get props => [viewAmount];
}

class ChangedInitialState extends ViewAmountState {
  const ChangedInitialState({required super.viewAmount});

  @override
  List<Object?> get props => [viewAmount];
}
