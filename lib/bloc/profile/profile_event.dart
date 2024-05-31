part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileDataEvent extends ProfileEvent {
  final int userId;

  const GetProfileDataEvent(this.userId);
  @override
  List<Object?> get props => [userId];
}
