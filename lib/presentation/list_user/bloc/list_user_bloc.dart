import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:time/time.dart';

part 'list_user_bloc.freezed.dart';
part 'list_user_event.dart';
part 'list_user_state.dart';

@injectable
class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  ListUserBloc() : super(ListUserState.initial()) {
    on<ListUserEvent>((event, emit) async {
      await event.when(
        get: () async {
          emit(state.copyWith(loading: true));
          await 500.milliseconds.delay;
          emit(
            state.copyWith(
              loading: false,
              users: ["1", "2", "3", "4", "5", "6", "7", "8"],
            ),
          );
        },
        loadMore: () async {
          emit(state.copyWith(loading: true));
          await 2.seconds.delay;
          int lastUser = int.parse(state.users.last);
          emit(
            state.copyWith(
              loading: false,
              users: [
                ...state.users,
                '${lastUser + 1}',
                '${lastUser + 2}',
                '${lastUser + 3}',
              ],
            ),
          );
        },
      );
    });
  }
}
