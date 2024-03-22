import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vtuberlist/core/helper/app_share_preference.dart';
import 'package:vtuberlist/core/network/feature_api/login/login_api.dart';
import 'package:vtuberlist/feature/login/view_object/login_model.dart';

import '../../../core/utils/injections.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  bool _emailJudge = false;
  get emailJudge => _emailJudge;
  bool _passwordJudge = false;
  get passwordJudge => _passwordJudge;


  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<EmailJudgeLoginEvent>(_onEmailCheckAction);
    on<PasswordJudgeLoginEvent>(_onPasswordCheckAction);
    on<LoginClickLoginEvent>(_onLoginLoginAction);
  }

  _onEmailCheckAction(EmailJudgeLoginEvent event, Emitter<LoginState> emitter) {
    print("JN - Email Judge ${event.email}");
    if (event.email.isNotEmpty) {
      final emailFormat = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
      _emailJudge = emailFormat.hasMatch(event.email);
    } else {
      _emailJudge = false;
    }

    if (_passwordJudge && _emailJudge) {
      emitter(EmailAndPasswordCheckOKLoginState(true));
    } else {
      emitter(EmailAndPasswordCheckOKLoginState(false));
    }
  }

  _onPasswordCheckAction(PasswordJudgeLoginEvent event, Emitter<LoginState> emitter) {
    _passwordJudge = event.password.isNotEmpty && (event.password.length > 6);
    if (_emailJudge && _passwordJudge) {
      emitter(EmailAndPasswordCheckOKLoginState(true));
    } else {
      emitter(EmailAndPasswordCheckOKLoginState(false));
    }
  }

  _onLoginLoginAction(LoginClickLoginEvent event, Emitter<LoginState> emitter) async {
    final provider = LoginAPI();
    Map<String, dynamic> responseData = await provider.login(event.email, event.password);
    emitter(_apiJudge(responseData));
  }

  LoginState _apiJudge(Map<String,dynamic> data) {
    if (data["returnValue"] == 0) {
      String token = data["returnData"]["token"];
      s1<APPSharePreferences>().saveToken(token);
      return LoginSuccessLoginState(token);
    } else if (data["returnValue"] == 1){
      return LoginAPIErrorLoginState(LoginErrorType.EmailError, data["returnMessage"]);
    } else {
      return LoginAPIErrorLoginState(LoginErrorType.PasswordError, data["returnMessage"]);
    }
  }

}
