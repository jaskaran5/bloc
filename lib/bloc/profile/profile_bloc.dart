import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/profile_model.dart';
import '../../repo/profile_repo.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileResponse? profileResponse;

  var profilePics = [
    'https://images.pexels.com/photos/593655/pexels-photo-593655.jpeg?cs=srgb&dl=pexels-jovana-nesic-188639-593655.jpg&fm=jpg',
    'https://img.freepik.com/free-photo/zen-balancing-pebbles-misty-lake_53876-138198.jpg',
    'https://w0.peakpx.com/wallpaper/256/602/HD-wallpaper-special-flower-nature-lover-sudheer-pics-spring-blossom-thumbnail.jpg',
    'https://www.pics4learning.com/images/pics-banner1-850.jpg',
    'https://xoxobella.com/wp-content/uploads/2020/08/instagram_captions_for_flower_photos_bella_bucchiotti-1.jpg',
  ];

  int i = 1;
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileDataEvent>(getProfileData);
    add(const GetProfileDataEvent(1));
  }

  FutureOr<void> getProfileData(
      GetProfileDataEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileSuccessState());
      final response = await ProfileRepo.getProfileData(
          userId: event.userId == 4 ? 5 : event.userId);

      final data = profileResponseFromJson(response.body);

      if (data.userId != null) {
        profileResponse = data;
        log('profile having data>>>>>>>>>>> ${profileResponse?.profilePic}');
        profileResponse?.profilePic = profilePics[event.userId - 1];
        log('profile having data>>>>>>>>>>> ${profileResponse?.profilePic}');

        emit(ProfileLoadingState());
      }
    } catch (e) {
      log('api Exception >>>>>>>>>>>>> $e');
      emit(GetProfileDateFailedState('$e'));
    }
  }
}
