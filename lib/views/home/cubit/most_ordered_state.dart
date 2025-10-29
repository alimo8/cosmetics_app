part of 'most_ordered_cubit.dart';

@immutable
sealed class MostOrderedState {}

final class MostOrderedInitial extends MostOrderedState {}

final class MostOrderedLoading extends MostOrderedState {}

final class MostOrderedSuccess extends MostOrderedState {
  final List<MostOrderedModel> mostOrder;

  MostOrderedSuccess(this.mostOrder);
}

final class MostOrderedErorr extends MostOrderedState {
  final String errorMessage;

  MostOrderedErorr(this.errorMessage);
}
