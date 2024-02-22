import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app.dart';
import '../../domain/login/repositories/login_repository.dart';
import '../../domain/login/usecases/login_usecase.dart';
import 'bloc/login_bloc.dart';
import 'ui/login_screen.dart';

// Project imports:

class LoginRoute {
  static Widget get route => BlocProvider(
        create: (context) => LoginBloc(
          LoginUseCase(
            getIt<LoginRepository>(),
          ),
        ),
        child: const LoginScreen(),
      );
}
