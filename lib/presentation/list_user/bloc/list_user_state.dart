part of 'list_user_bloc.dart';

@freezed
class ListUserState with _$ListUserState {
  const factory ListUserState({
    @Default([]) List<String> users,
    @Default(false) bool loading,
  }) = _ListUserState;

  factory ListUserState.initial() => const ListUserState();
}
