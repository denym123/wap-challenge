import 'package:flutter_modular/flutter_modular.dart';
import 'daos/daos.dart';
import 'task_form.dart';

class TaskFormModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(TaskFormController.new);
    i.add(TaskFormRepository.new);
    i.add(TaskFormDao.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => TaskFormPage(taskId: r.args.data),
    );
  }
}
