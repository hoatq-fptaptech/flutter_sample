import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app.dart';
import 'bloc/list_user_bloc.dart';
import 'ui/list_user_screen.dart';

// Project imports:

class ListUserRoute {
  static Widget get route => BlocProvider(
        create: (context) =>
            getIt<ListUserBloc>()..add(const ListUserEvent.get()),
        child: const ListUserScreen(),
      );
}
