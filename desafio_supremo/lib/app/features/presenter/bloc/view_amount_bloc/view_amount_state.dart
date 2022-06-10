import 'package:equatable/equatable.dart';

abstract class ViewAmountState extends Equatable {
  final bool? viewAmount;

  const ViewAmountState({this.viewAmount});
}

class ViewAmountInitialState extends ViewAmountState {
  const ViewAmountInitialState({super.viewAmount});

  @override
  List<Object?> get props => [];
}

class ViewAmountLoadState extends ViewAmountState {
  const ViewAmountLoadState({required super.viewAmount});

  @override
  List<Object?> get props => [viewAmount];
}

class ChangedInitialState extends ViewAmountState {
  const ChangedInitialState({required super.viewAmount});

  @override
  List<Object?> get props => [viewAmount];
}
