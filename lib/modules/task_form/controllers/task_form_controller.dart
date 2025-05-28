import '../../../core/core.dart';
import '../task_form.dart';

class TaskFormController with ControllerLifeCycle, TaskFormVariables {
  final TaskFormRepository _task_formRepository;

  TaskFormController({
    required TaskFormRepository task_formRepository,
  }) : _task_formRepository = task_formRepository;
}
