part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class EmailJudgeLoginEvent extends LoginEvent {
  final String email;

  EmailJudgeLoginEvent(this.email);
}

class PasswordJudgeLoginEvent extends LoginEvent {
  final String password;

  PasswordJudgeLoginEvent(this.password);
}

class LoginClickLoginEvent extends LoginEvent {
  final String email;
  final String password;

  LoginClickLoginEvent(this.email, this.password);
}