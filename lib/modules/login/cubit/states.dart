import 'package:la_vie/models/login_model/login_model.dart';

abstract class LoginState {}

class LoadingLogin extends LoginState {}

class LoginInitState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel model;
  LoginSuccessState(this.model);
}

class LoginFailedState extends LoginState {
  final LoginModel model;
  final String error;
  LoginFailedState(this.error,this.model);
}

class ChangePasswordVisState extends LoginState {}
