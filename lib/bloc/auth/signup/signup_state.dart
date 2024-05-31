abstract class SignupState {}

class SignUpInitialState extends SignupState {}

class SignUpValidateState extends SignupState {}

class SignUpValidationFailedState extends SignupState {
  final String error;
  SignUpValidationFailedState({required this.error});
}

class SignUpLoadingState extends SignupState {}
