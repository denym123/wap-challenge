import '../../../core/core.dart';
import '../home.dart';

class HomeController with ControllerLifeCycle, HomeVariables {
  final HomeRepository _homeRepository;

  HomeController({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;
}
