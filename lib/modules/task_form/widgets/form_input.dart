import 'package:flutter/material.dart';

import '../models/field.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final Field field;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const FormInput({
    super.key,
    required this.controller,
    this.keyboardType,
    required this.field,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14),
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: _defaultBorder(context),
        focusedBorder: _defaultBorder(context).copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: _defaultBorder(context).copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: _defaultBorder(context).copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        disabledBorder: _defaultBorder(context),
        label: Text(field.label ?? ''),
        errorMaxLines: 3,
        contentPadding: EdgeInsets.fromLTRB(14, 12.5, 14, 12),
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
        filled: true,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.inverseSurface,
          fontSize: 12,
        ),
      ),
    );
  }

  OutlineInputBorder _defaultBorder(context) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.transparent),
  );
}
