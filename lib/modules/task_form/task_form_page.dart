import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';
import '../home/enums/enums.dart';
import 'task_form.dart';
import 'widgets/form_input_list.dart';

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
            child: Watch((context) {
              return SignalFutureBuilder(
                asyncState: controller.taskAS.value,
                builder: (data) {
                  return Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackButton(),
                      Text(
                        data.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        data.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      FormInputList(
                        controller: controller,
                        fields: data.fields!,
                      ),
                      if (controller.taskInstance?.taskStatus !=
                          TaskStatus.completed) ...[
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                label: "Finalizar",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.submitTask();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
