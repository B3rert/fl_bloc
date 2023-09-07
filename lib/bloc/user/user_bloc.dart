import 'package:bloc/bloc.dart';
import 'package:fl_bloc/models/user.dart';
import 'package:meta/meta.dart';
part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>(((event, emit) => emit(UserSetState(event.user))));
    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<ChangeProfession>((event, emit) {
      if (!state.existUser) return;

      final professions = [...state.user!.profesiones, event.profession];
      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });

    on<ResetUser>(((event, emit) => emit(const UserInitialState())));
  }
}
