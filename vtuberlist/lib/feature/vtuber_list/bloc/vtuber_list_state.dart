part of 'vtuber_list_bloc.dart';

@immutable
sealed class VtuberListState {}

final class VtuberListInitial extends VtuberListState {}

final class OutPageVtuberListState extends VtuberListState {
  OutPageVtuberListState();
}

final class BackInPageVtuberListState extends VtuberListState {
  BackInPageVtuberListState();
}