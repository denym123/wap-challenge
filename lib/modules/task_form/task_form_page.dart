import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';
import 'task_form.dart';
import 'widgets/form_input.dart';

class TaskFormPage extends StatefulWidget {
  final int taskId;
  const TaskFormPage({super.key, required this.taskId});

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState
    extends PageLifeCycleState<TaskFormController, TaskFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Map<String, dynamic>? get params {
    return {'task_id': widget.taskId};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.task?.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  controller.task?.description ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Watch((context) {
                  if (controller.task != null) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 24),
                        itemCount: controller.task!.fields!.length,
                        itemBuilder: (context, index) {
                          final field = controller.task!.fields![index];
                          return FormInput(
                            validator: (value) {
                              if (field.required &&
                                  (value == null || value.isEmpty)) {
                                return 'Este campo é obrigatório';
                              }
                              return null;
                            },
                            field: field,
                            controller: controller.controllers[field.id]!,
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                PrimaryButton(
                  label: "Submit",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.submitTask();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
