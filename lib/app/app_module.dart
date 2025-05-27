import 'package:flutter_modular/flutter_modular.dart';

import '../core/constants/route.dart';
import '../global_modules/core/core_module.dart';
import '../modules/modules.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.module(Route.splash, module: SplashModule());
    r.module(Route.login, module: LoginModule());
    r.module(Route.home, module: HomeModule());
  }
}
