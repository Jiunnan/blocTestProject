part of 'landing_cubit.dart';

@immutable
abstract class LandingState {}

class LandingInitial extends LandingState {

}

class LandingJudge extends LandingState {
  final LoadingJudge judgeResult;

  LandingJudge(this.judgeResult);
}

class LandingToLogin extends LandingState {

}

class LandingAutoLoading extends LandingState {
  final bool loadingSuccess;

  LandingAutoLoading(this.loadingSuccess);
}

class LandingAutoLoadingError extends LandingState {

}

class LandingToMain extends LandingState {

}
