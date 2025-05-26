import '../../../core/core.dart';
import '../splash.dart';

class SplashController with ControllerLifeCycle, SplashVariables {
  final SplashRepository _splashRepository;

  SplashController({
    required SplashRepository splashRepository,
  }) : _splashRepository = splashRepository;
}
