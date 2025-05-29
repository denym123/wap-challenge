import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../daos/task_form_dao.dart';
import '../models/models.dart';
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

  Future<void> updateFieldResponse(int fieldId) async {
    final fieldResponse = await _taskFormDao.getFieldResponse(
      taskInstance!.id,
      fieldId,
    );
    fieldResponse!.value = controllers[fieldId]!.text;
    await _taskFormDao.updateFieldResponse(fieldResponse);
  }

  Future<void> buildTask() async {
    final Task task = await _taskFormDao.getTask(taskId!);
    final fields = await _taskFormDao.getFields(taskId!);
    task.fields = fields;
    this.task = task;
    controllers = Map.fromEntries(
      fields.map((field) => MapEntry(field.id, TextEditingController())),
    );
    await createTaskInstance();
  }

  Future<void> createTaskInstance() async {
    taskInstance = await _taskFormDao.getTaskInstance(taskId!);
    if (taskInstance == null) {
      await _taskFormDao.createTaskInstance(taskId!);
      createTaskInstance();
      return;
    }
    for (var field in task!.fields!) {
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
    }
  }

  Future<void> submitTask() async {
    final List<String> anwsers = [];
    for (var controller in controllers.values) {
      anwsers.add(controller.text);
    }
    print(anwsers);
  }
}
