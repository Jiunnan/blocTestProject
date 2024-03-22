import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_vtuber_add_event.dart';
part 'new_vtuber_add_state.dart';

class NewVtuberAddBloc extends Bloc<NewVtuberAddEvent, NewVtuberAddState> {
  NewVtuberAddBloc() : super(NewVtuberAddInitial()) {
    on<NewVtuberAddEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
