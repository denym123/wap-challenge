import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/extensions/extensions.dart';

import '../models/field.dart';
import '../task_form.dart';
import 'form_input.dart';

class FormInputList extends StatelessWidget {
  final TaskFormController controller;
  final List<Field> fields;
  const FormInputList({
    super.key,
    required this.controller,
    required this.fields,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemCount: fields.length,
        itemBuilder: (context, index) {
          final field = fields[index];
          return FormInput(
            label: field.label ?? '',
            inputFormatters: [
              TextInputMask(
                mask: [field.fieldType.toFieldType().mask],
                reverse: field.fieldType.toFieldType().isReverse,
              ),
            ],
            controller: controller.controllers[field.id]!,
            onChanged: () {
              controller.onFieldChanged(field.id);
            },
            validator: (value) {
              if (field.required && (value == null || value.isEmpty)) {
                return 'Este campo é obrigatório';
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
