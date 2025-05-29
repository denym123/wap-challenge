import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onChanged;
  final String label;
  final bool? isReadOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const FormInput({
    super.key,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    required this.label,
    this.inputFormatters,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isReadOnly == false,
      onChanged: (value) {
        onChanged!();
      },
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14),
      keyboardType: keyboardType,
      validator: validator,
      inputFormatters: inputFormatters,
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
        label: Text(label),
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
