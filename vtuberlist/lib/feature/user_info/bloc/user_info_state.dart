part of 'user_info_bloc.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

final class OutPageUserInfoState extends UserInfoState {
  OutPageUserInfoState();
}

final class BackInPageUserInfoState extends UserInfoState {
  BackInPageUserInfoState();
}