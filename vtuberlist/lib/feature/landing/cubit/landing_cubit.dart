import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtuberlist/core/helper/app_share_preference.dart';
import 'package:vtuberlist/core/router/router_name.dart';
import 'package:vtuberlist/core/utils/injections.dart';
import 'package:vtuberlist/feature/landing/view_object/landing_model.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  void nextState() {
    if (this.state is LandingJudge) {
      if ((this.state as LandingJudge).judgeResult == LoadingJudge.ToAutoLoading) {
        dataAutoLoading();
      } else {
        emit(LandingToLogin());
      }
    } else if (this.state is LandingAutoLoading) {
      if ((this.state as LandingAutoLoading).loadingSuccess) {
        emit(LandingToMain());
      } else {
        emit(LandingAutoLoadingError());
      }
    }
  }

  void judgeLogin() {
    String loginToken = s1<APPSharePreferences>().getToken();
    if (loginToken.isNotEmpty) {
      emit(LandingJudge(LoadingJudge.ToAutoLoading));
    } else {
      emit(LandingJudge(LoadingJudge.ToLogin));
    }
  }

  void dataAutoLoading() {
    Timer(const Duration(milliseconds: 100), () {
      emit(LandingAutoLoading(true));
    });
  }

  void toLoginPage(BuildContext context) {
    Navigator.of(context).pushNamed(RouterName.LoginPageName);
  }

  void toMainPage(BuildContext context, bool success) {
    if (success) {
      Navigator.of(context).pushNamed(RouterName.MainPageName);
    } else {
      toLoginPage(context);
    }
  }

  @override
  void onChange(Change<LandingState> change) {
    super.onChange(change);
  }
}
