part of 'increment_bloc.dart';

sealed class IncrementEvent extends Equatable {
  const IncrementEvent();
}

 class CountIncrementEvent extends IncrementEvent {

  @override

  List<Object?> get props => [];

}
