import 'package:flutter_modular/flutter_modular.dart';
import 'home.dart';

 class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeController.new);
    i.add(HomeRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const HomePage()
    );
  }
}
