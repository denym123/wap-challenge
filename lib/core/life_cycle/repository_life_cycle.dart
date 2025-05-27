import 'package:flutter_modular/flutter_modular.dart';
import '../core.dart';

abstract class RepositoryLifeCycle {
  final httpAdapter = Modular.get<HttpAdapter>();
}
