// Project imports:

import 'package:injectable/injectable.dart';

import '../../../data/login/models/request/login_request.dart';
import '../entities/user_entitiy.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<UserEntity> login(LoginRequest request) => _repository.login(request);
}
