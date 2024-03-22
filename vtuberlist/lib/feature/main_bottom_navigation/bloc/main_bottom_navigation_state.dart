part of 'main_bottom_navigation_bloc.dart';

@immutable
sealed class MainBottomNavigationState {}

final class MainBottomNavigationInitial extends MainBottomNavigationState {}

final class ChangeCompleteMainBottomNavigationState extends MainBottomNavigationState {
  final int changeIndex;

  ChangeCompleteMainBottomNavigationState(this.changeIndex);
}

final class IdleMainBottomNavigationState extends MainBottomNavigationState {

  IdleMainBottomNavigationState();
}

final class OutPageMainBottomNavigationState extends MainBottomNavigationState {

  OutPageMainBottomNavigationState();
}

final class BackInPageMainBottomNavigationState extends MainBottomNavigationState {
  BackInPageMainBottomNavigationState();
}