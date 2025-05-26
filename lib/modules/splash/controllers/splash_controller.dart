import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../splash.dart';

class SplashController with ControllerLifeCycle, SplashVariables {
  final SplashRepository _splashRepository;

  SplashController({required SplashRepository splashRepository})
    : _splashRepository = splashRepository;

  @override
  void onReady() {
    initApp();
  }

  void initApp() async {
    await Future.delayed(const Duration(seconds: 2));
    Modular.to.pushReplacementNamed('/login');
  }
}
