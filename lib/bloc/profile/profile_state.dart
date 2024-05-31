part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileSuccessState extends ProfileState {
  @override
  List<Object> get props => [];
}

final class GetProfileDateFailedState extends ProfileState {
  final String error;

  const GetProfileDateFailedState(this.error);
  @override
  List<Object> get props => [error];
}
