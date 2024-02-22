part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.logInPressed(
    String userName,
    String password,
    bool isError,
  ) = _LogInPressed;
}
