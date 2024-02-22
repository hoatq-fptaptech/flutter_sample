import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/login/models/request/login_request.dart';
import '../../../../data/utils/exceptions/api_exception.dart';
import '../../../../domain/login/usecases/login_usecase.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        logInPressed: (userName, password, isError) async {
          emit(
            state.copyWith(
              status: LoginStateStatus.loading,
              errorMessage: '',
            ),
          );
          try {
            await loginUseCase.login(
              LoginRequest(userName: event.userName, password: event.password),
            );
            if (event.isError) {
              emit(
                state.copyWith(
                  status: LoginStateStatus.error,
                  errorMessage: 'Fake error',
                ),
              );
            } else {
              emit(
                state.copyWith(
                  status: LoginStateStatus.success,
                ),
              );
            }
          } on ApiException catch (e) {
            emit(
              state.copyWith(
                status: LoginStateStatus.error,
                errorMessage: e.displayError,
              ),
            );
          }
        },
      );
    });
  }
}
