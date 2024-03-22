import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_bottom_navigation_event.dart';
part 'main_bottom_navigation_state.dart';

class MainBottomNavigationBloc extends Bloc<MainBottomNavigationEvent, MainBottomNavigationState> {

  int _nowIndex = 0;

  MainBottomNavigationBloc() : super(MainBottomNavigationInitial()) {
    on<MainBottomNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangePageMainBottomNavigationEvent>(_onChangePageMainBottomNavigation);
    on<OutPageMainBottomNavigationEvent>(_onOutPageMainBottomNavigation);
    on<BackInPageMainBottomNavigationEvent>(_onBackInPageMainBottomNavigation);
  }

  _onChangePageMainBottomNavigation(ChangePageMainBottomNavigationEvent event, Emitter<MainBottomNavigationState> emitter) {
    if (event.pageIndex != _nowIndex) {
      print("JN - change complete");
      _nowIndex = event.pageIndex;
      emitter(ChangeCompleteMainBottomNavigationState(_nowIndex));
    }
  }

  _onOutPageMainBottomNavigation(OutPageMainBottomNavigationEvent event, Emitter<MainBottomNavigationState> emitter) {
    emitter(OutPageMainBottomNavigationState());
  }

  _onBackInPageMainBottomNavigation(BackInPageMainBottomNavigationEvent event, Emitter<MainBottomNavigationState> emitter) {
    emitter(BackInPageMainBottomNavigationState());
  }
}
