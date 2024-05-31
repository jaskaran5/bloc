import 'dart:async';
import 'dart:developer';

import 'package:bloc_project/bloc/internet/internet_event.dart';
import 'package:bloc_project/bloc/internet/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitialState()) {
    on<InternetConnectionCheckerEvent>(internetChecker);
  }

  Future<FutureOr<void>> internetChecker(
      InternetConnectionCheckerEvent event, Emitter<InternetState> emit) async {
    log('value>>>>>>>>>>>>>>> ${event.isInternetConnected}');
    if (event.isInternetConnected) {
      log('true>>>>>>>>>>>>>');
      emit(InternetConnectedState());
    } else {
      log('false>>>>>>>>>>>>>>');
      emit(InternetLostState());
    }
  }
}
