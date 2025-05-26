import 'package:flutter_modular/flutter_modular.dart';
import 'login.dart';

 class LoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(LoginController.new);
    i.add(LoginRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const LoginPage()
    );
  }
}
