import 'package:flutter_modular/flutter_modular.dart';

import '../core/constants/route.dart';
import '../global_modules/core/core_module.dart';
import '../modules/modules.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.module(Routes.splash, module: SplashModule());
    r.module(Routes.login, module: LoginModule());
    r.module(Routes.home, module: HomeModule());
    r.module(Routes.taskForm, module: TaskFormModule());
  }
}
