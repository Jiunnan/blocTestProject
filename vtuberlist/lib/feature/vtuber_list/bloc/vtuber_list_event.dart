part of 'vtuber_list_bloc.dart';

@immutable
sealed class VtuberListEvent {}

class VtuberListEventInitial extends VtuberListEvent {
  VtuberListEventInitial();
}

class OutPageVtuberListEvent extends VtuberListEvent {
  OutPageVtuberListEvent();
}

class BackInPageVtuberListEvent extends VtuberListEvent {
  BackInPageVtuberListEvent();
}