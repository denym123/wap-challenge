import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../home.dart';

class HomeController with ControllerLifeCycle, HomeVariables {
  final HomeRepository _homeRepository;
  final UserStore _userStore = Modular.get<UserStore>();

  HomeController({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  void onReady() {
    getTasks();
    getUser();
  }

  Future<void> getTasks() async {
    FutureHandler(
      future: tasksAS,
      repositoryFunction: _homeRepository.getTasks(),
    ).call();
  }

  Future<void> getUser() async {
    FutureHandler(
      future: userAS,
      repositoryFunction: _homeRepository.getUser(),
      onValue: (value) {
        _userStore.user = value;
      },
    ).call();
  }
}
