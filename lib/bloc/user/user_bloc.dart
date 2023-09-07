import 'package:bloc/bloc.dart';
import 'package:fl_bloc/models/user.dart';
import 'package:meta/meta.dart';
part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>(((event, emit) => emit(UserSetState(event.user))));
  }
}
