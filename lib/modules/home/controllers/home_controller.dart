import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../../../core/handlers/multi_future_handler.dart';
import '../home.dart';

class HomeController with ControllerLifeCycle, HomeVariables {
  final HomeRepository _homeRepository;
  final HomeDao _homeDao;

  HomeController({
    required HomeRepository homeRepository,
    required HomeDao homeDao,
  }) : _homeRepository = homeRepository,
       _homeDao = homeDao;

  @override
  void onReady() async {
    await getUser();
    getTasks();
  }

  Future<void> getTasks() async {
    final userId = await LocalSecureStorageImpl().read(LSSConstants.userId);
    MultiFutureHandler(
      secondFunction: _homeRepository.getTasks(),
      firstFunction: _homeDao.getTaskInstances(int.parse(userId!)),
      resultBuilder: (db, api) async {
        final userId = await LocalSecureStorageImpl().read(LSSConstants.userId);
        await _homeDao.saveTasks(api, int.parse(userId!));
        return _buildTaskModels(db, api);
      },
      future: tasksAS,
      noConnectionBuilder: () async {
        final tasks = await _homeDao.getTasks();
        final taskInstances = await _homeDao.getTaskInstances(
          int.parse(userId),
        );
        return _buildTaskModels(taskInstances, tasks);
      },
    ).call();
  }

  Future<void> clearTaskInstances() async {
    await _homeDao.clearTaskInstances();
    getTasks();
  }

  Future<void> getUser() async {
    await FutureHandler(
      future: userAS,
      repositoryFunction: _homeRepository.getUser(),
      noConnectionBuilder: () async {
        final userId = await LocalSecureStorageImpl().read(LSSConstants.userId);
        final userName = await LocalSecureStorageImpl().read(
          LSSConstants.userName,
        );
        return User(id: int.parse(userId!), name: userName!);
      },
      onValue: saveUser,
    ).call();
  }

  List<TaskModel> _buildTaskModels(
    List<TaskInstance> taskInstances,
    List<Task> tasks,
  ) {
    final List<TaskModel> taskModels = [];

    for (var task in tasks) {
      final instances =
          taskInstances
              .where((instance) => instance.taskId == task.taskId)
              .toList();

      final bool noInstanceInDb = instances.isEmpty;

      if (noInstanceInDb) {
        taskModels.add(
          TaskModel(
            taskId: task.taskId,
            taskName: task.taskName,
            description: task.description,
            taskStatus: TaskStatus.notStarted,
          ),
        );
      } else {
        for (var instance in instances) {
          taskModels.add(
            TaskModel(
              taskName: task.taskName,
              description: task.description,
              taskStatus: instance.taskStatus,
              createdAt: instance.createdAt.toString(),
              taskId: task.taskId,
            ),
          );
        }
      }
    }
    return taskModels;
  }

  Future<void> saveUser(user) async {
    await Future.wait([
      LocalSecureStorageImpl().write(LSSConstants.userId, user.id.toString()),
      LocalSecureStorageImpl().write(LSSConstants.userName, user.name),
    ]);
  }

  void logout() {
    LocalSecureStorageImpl().clear();
    Modular.to.navigate(Routes.login);
  }
}
