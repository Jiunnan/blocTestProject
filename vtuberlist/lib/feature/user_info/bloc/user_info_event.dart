part of 'user_info_bloc.dart';

@immutable
sealed class UserInfoEvent {}

class UserInfoEventInitial extends UserInfoEvent {
  UserInfoEventInitial();
}

class OutPageUserInfoEvent extends UserInfoEvent {
  OutPageUserInfoEvent();
}

class BackInPageUserInfoEvent extends UserInfoEvent {
  BackInPageUserInfoEvent();
}
