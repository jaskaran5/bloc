import 'package:bloc_project/utils/utils.dart';

class Validator {
  static String error = '';

  static bool signUpValidator({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    if (email.isEmpty) {
      error = 'Please Enter your Email';
      return false;
    } else if (email.isValidEmail == false) {
      error = 'Please Enter valid email';
      return false;
    } else if (password.isEmpty) {
      error = 'Please Enter your Password';
      return false;
    } else if (password.isPasswordValidate == false) {
      error =
          'Password must contain 1 uppercase, 1 lowercase, 1 special character and it should be greater then 8 ';
      return false;
    } else if (confirmPassword.isEmpty) {
      error = 'Please Enter your Confirm Password';
      return false;
    } else if (password != confirmPassword) {
      error = 'Password and  Confirm Password is different';
      return false;
    } else {
      error = '';
      return true;
    }
  }
}
