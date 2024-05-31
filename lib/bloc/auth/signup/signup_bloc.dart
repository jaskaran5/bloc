import 'dart:async';
import 'dart:developer';

import 'package:bloc_project/bloc/auth/signup/signup_event.dart';
import 'package:bloc_project/bloc/auth/signup/signup_state.dart';
import 'package:bloc_project/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String error = '';

  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpOnChangeEvent>(onChanged);
  }

  /// used to check the validation of signup.
  FutureOr<void> onChanged(
      SignUpOnChangeEvent event, Emitter<SignupState> emit) {
    var valid = Validator.signUpValidator(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );
    log('Date:>>>>>>>>>>>${emailController.text}>>>>>>>>>${passwordController.text}>>>>>>>>>>${confirmPasswordController.text}');
    if (valid) {
      log('signup Validation True>>>>>>>>>>>>>>>>>>>>>>>>>>');
      emit(SignUpValidateState());
    } else {
      log('signup Validation false>>>>>>>>>>>>>>>>>>>>>>>>>>');
      error = Validator.error;
      emit(SignUpValidationFailedState(error: error));
    }
  }
}
