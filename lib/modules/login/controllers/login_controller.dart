import '../../../core/core.dart';
import '../login.dart';

class LoginController with ControllerLifeCycle, LoginVariables {
  final LoginRepository _loginRepository;

  LoginController({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;
}
