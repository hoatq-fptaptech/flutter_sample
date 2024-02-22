// Project imports:

import '../../../data/login/models/request/login_request.dart';
import '../../../data/login/models/response/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(LoginRequest request);
}
