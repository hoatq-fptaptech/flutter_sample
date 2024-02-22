part of 'login_bloc.dart';

enum LoginStateStatus { initial, loading, error, success }

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginStateStatus.initial) LoginStateStatus status,
    @Default('') String errorMessage,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState();
}
