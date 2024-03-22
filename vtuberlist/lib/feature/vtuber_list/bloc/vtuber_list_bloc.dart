import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vtuber_list_event.dart';
part 'vtuber_list_state.dart';

class VtuberListBloc extends Bloc<VtuberListEvent, VtuberListState> {
  VtuberListBloc() : super(VtuberListInitial()) {
    on<VtuberListEvent>((event, emit) {
      // TODO: implement event handler

    });

    on<VtuberListEventInitial>(_onVtuberListEventInitial);
    on<OutPageVtuberListEvent>(_onOutPageVtuberList);
    on<BackInPageVtuberListEvent>(_onBackInPageVtuberList);
  }

  _onVtuberListEventInitial(VtuberListEventInitial event, Emitter<VtuberListState> emitter) {
    emitter(VtuberListInitial());
  }

  _onOutPageVtuberList(OutPageVtuberListEvent event, Emitter<VtuberListState> emitter) {
    emitter(OutPageVtuberListState());
  }

  _onBackInPageVtuberList(BackInPageVtuberListEvent event, Emitter<VtuberListState> emitter) {
    emitter(BackInPageVtuberListState());
  }
}
