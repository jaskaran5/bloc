part of 'increment_bloc.dart';

sealed class IncrementState extends Equatable {
  const IncrementState();
}

final class IncrementInitial extends IncrementState {
  @override
  List<Object> get props => [];
}

final class IncrementLoading extends IncrementState {
  @override
  List<Object> get props => [];
}

final class IncrementLoaded extends IncrementState {
  final int count;

  const IncrementLoaded({required this.count});
  @override
  List<Object> get props => [count];
}

final class IncrementError extends IncrementState {
  final String error;

  const IncrementError({required this.error});
  @override
  List<Object> get props => [error];
}
