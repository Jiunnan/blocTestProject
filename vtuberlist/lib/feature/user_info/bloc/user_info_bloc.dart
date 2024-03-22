import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial()) {
    on<UserInfoEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UserInfoEventInitial>(_onUserInfoInitial);
    on<OutPageUserInfoEvent>(_onOutPageUserInfo);
    on<BackInPageUserInfoEvent>(_onBackInPageUserInfo);
  }

  _onUserInfoInitial(UserInfoEventInitial event, Emitter<UserInfoState> emitter) {
    emitter(UserInfoInitial());
  }

  _onOutPageUserInfo(OutPageUserInfoEvent event, Emitter<UserInfoState> emitter) {
    emitter(OutPageUserInfoState());
  }

  _onBackInPageUserInfo(BackInPageUserInfoEvent event, Emitter<UserInfoState> emitter) {
    emitter(BackInPageUserInfoState());
  }
}
