part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {

}

class EmailCheckOKLoginState extends LoginState {
  final bool isOK;

  EmailCheckOKLoginState(this.isOK);
}

class PasswordCheckOKLoginState extends LoginState {
  final bool isOK;

  PasswordCheckOKLoginState(this.isOK);
}

class EmailAndPasswordCheckOKLoginState extends LoginState {
  final bool isOK;

  EmailAndPasswordCheckOKLoginState(this.isOK);
}

class LoginSuccessLoginState extends LoginState {
  final String token;

  LoginSuccessLoginState(this.token);
}

class LoginAPIErrorLoginState extends LoginState {
  final LoginErrorType errorType;
  final String errorMsg;

  LoginAPIErrorLoginState(this.errorType, this.errorMsg);
}
