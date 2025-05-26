import 'package:flutter_modular/flutter_modular.dart';

import '../modules/modules.dart';

class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {
    // TODO: implement exportedBinds
    super.exportedBinds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: SplashModule());
  }
}
