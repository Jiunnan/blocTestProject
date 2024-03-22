part of 'main_bottom_navigation_bloc.dart';

@immutable
sealed class MainBottomNavigationEvent {}

class ChangePageMainBottomNavigationEvent extends MainBottomNavigationEvent {
  final int pageIndex;

  ChangePageMainBottomNavigationEvent(this.pageIndex);
}

class OutPageMainBottomNavigationEvent extends MainBottomNavigationEvent {

  OutPageMainBottomNavigationEvent();
}

class BackInPageMainBottomNavigationEvent extends MainBottomNavigationEvent {
  BackInPageMainBottomNavigationEvent();
}