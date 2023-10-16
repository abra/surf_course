import 'package:flutter/material.dart';

import 'form_field_widget.dart';

class NumberFormFieldWidget extends StatelessWidget {
  const NumberFormFieldWidget({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormFieldWidget(
      label: label,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      focusNode: FocusNode(),
      validator: validator ?? _defaultValidator,
      controller: TextEditingController(),
    );
  }

  String? _defaultValidator(String? value) {
    value = value?.trim() ?? '';
    final number = double.tryParse(value) ?? 0;
    if (number <= 0) {
      return 'Укажите вес, больше 0 кг';
    }
    return null;
  }
}
