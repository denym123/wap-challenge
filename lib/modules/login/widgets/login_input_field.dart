import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class LoginInputField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final bool? enabled;
  final bool? enableInteractiveSelection;

  LoginInputField({
    super.key,
    this.label,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.enabled,
    this.enableInteractiveSelection,
  }) : _obscureTextVN = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: controller,

          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 14),
          enabled: enabled,
          keyboardType: keyboardType,
          obscureText: obscureTextVNValue,
          validator: validator,
          enableInteractiveSelection: enableInteractiveSelection,
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
            label: Text(label ?? ''),
            errorMaxLines: 3,
            contentPadding: EdgeInsets.fromLTRB(14, 12.5, 14, 12),
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            filled: true,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.inverseSurface,
              fontSize: 12,
            ),
            suffixIcon:
                obscureText
                    ? IconButton(
                      constraints: const BoxConstraints(),
                      style: IconButton.styleFrom(
                        foregroundColor: AppColors.i.dividerColor,
                      ),
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon:
                          obscureTextVNValue
                              ? Icon(
                                Icons.visibility,
                                size: 20,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                              )
                              : Icon(
                                Icons.visibility_off,
                                size: 20,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                              ),
                    )
                    : null,
          ),
        );
      },
    );
  }

  OutlineInputBorder _defaultBorder(context) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.transparent),
  );
}
