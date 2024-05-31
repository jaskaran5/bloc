import 'dart:developer';

import 'package:bloc_project/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/internet/internet_block.dart';
import '../bloc/internet/internet_event.dart';

class Utils {
  static Future<bool> internetChecker({required BuildContext context}) async {
    bool? value;
    final event = await Connectivity().checkConnectivity();
    Connectivity().onConnectivityChanged.listen((event) {
      if (event.first == ConnectivityResult.mobile ||
          event.first == ConnectivityResult.wifi) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('internet connected '),
          backgroundColor: Colors.green,
        ));
        InternetCubit().emitInternetGainedState();
        context.read<InternetBloc>().add(InternetConnectionCheckerEvent(true));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('internet Not connected '),
          backgroundColor: Colors.redAccent,
        ));
        context.read<InternetBloc>().add(InternetConnectionCheckerEvent(false));
        InternetCubit().emitInternetLostState();
      }
    });
    if (context.mounted) {
      if (event.first == ConnectivityResult.mobile ||
          event.first == ConnectivityResult.wifi) {
        value = true;
      } else {
        value = false;
      }
    }
    log('internet value>>>>>>>>>>> $value');

    return value ?? false;
  }
}

extension EmailValidator on String {
  bool get isValidEmail {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool get isPasswordValidate {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$')
        .hasMatch(this);
  }
}
