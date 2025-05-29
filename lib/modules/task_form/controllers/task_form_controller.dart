import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/core.dart';
import '../../../core/handlers/multi_future_handler.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/enums/task_status.dart';
import '../daos/task_form_dao.dart';
import '../models/task.dart';
import '../task_form.dart';

class TaskFormController with ControllerLifeCycle, TaskFormVariables {
  final TaskFormDao _taskFormDao;
  TaskFormController({required TaskFormDao taskFormDao})
    : _taskFormDao = taskFormDao;

  @override
  void onInit([Map<String, dynamic>? params]) {
    taskId = params?['task_id'];
  }

  @override
  void onReady() {
    buildTask();
  }

  void onFieldChanged(int fieldId) {
    debouncer.run(() {
      updateFieldResponse(fieldId);
    });
  }

  void buildControllers(Task task) {
    controllers = Map.fromEntries(
      task.fields!.map((field) => MapEntry(field.id, TextEditingController())),
    );
  }

  Future<void> updateFieldResponse(int fieldId) async {
    final fieldResponse = await _taskFormDao.getFieldResponse(
      taskInstance!.id,
      fieldId,
    );
    fieldResponse!.value = controllers[fieldId]!.text;
    await _taskFormDao.updateFieldResponse(fieldResponse);
  }

  Future<void> buildTask() async {
    await MultiFutureHandler(
      future: taskAS,
      firstFunction: _taskFormDao.getTask(taskId!),
      secondFunction: _taskFormDao.getFields(taskId!),
      resultBuilder: (task, fields) async {
        task.fields = fields;
        return task;
      },
      onValue: (task) async {
        buildControllers(task);
        await createTaskInstance(task);
      },
    ).call();
  }

  Future<void> createTaskInstance(Task task) async {
    taskInstance = await _taskFormDao.getTaskInstance(taskId!);
    if (taskInstance == null) {
      await _taskFormDao.createTaskInstance(taskId!);
      createTaskInstance(task);
      return;
    }
    for (var field in task.fields!) {
      final fieldResponse = await _taskFormDao.getFieldResponse(
        taskInstance!.id,
        field.id,
      );
      if (fieldResponse != null) {
        controllers[field.id]!.text = fieldResponse.value;
      } else {
        await _taskFormDao.createFieldResponse(
          taskInstance!.id,
          field.id,
          controllers[field.id]!.text,
        );
      }
      Modular.get<HomeController>().getTasks();
    }
  }

  Future<void> submitTask() async {
    taskInstance!.taskStatus = TaskStatus.completed;
    await _taskFormDao.updateTaskInstance(taskInstance!);
    Modular.get<HomeController>().getTasks();
    Modular.to.pop();
  }
}
