                         // enum is only create  in state if every state is empty then we make enum .

import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitState {
  initialState,
  lost,
  gained,
}

/// here create cubit.
class InternetCubit extends Cubit<InternetCubitState> {
  InternetCubit() : super(InternetCubitState.initialState) {
    checkConnectivity();
  }

  void emitInternetGainedState() {
    log('Gained cubit');
    emit(InternetCubitState.gained);
  }

  void checkConnectivity() async {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event.first == ConnectivityResult.none) {
        emitInternetLostState();
      } else {
        emitInternetGainedState();
      }
    });
  }

  void emitInternetLostState() {
    log('Lost cubit');

    emit(InternetCubitState.lost);
  }
}
