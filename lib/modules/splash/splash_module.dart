import 'package:flutter_modular/flutter_modular.dart';
import 'splash.dart';

 class SplashModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(SplashController.new);
    i.add(SplashRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SplashPage()
    );
  }
}
