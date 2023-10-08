import 'package:flutter/material.dart';

import 'base_form_field_widget.dart';

class EmailFormFieldWidget extends StatelessWidget {
  const EmailFormFieldWidget({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return BaseFormFieldWidget(
      label: label,
      keyboardType: TextInputType.emailAddress,
      validator: validator ?? _defaultValidator,
      controller: TextEditingController(),
    );
  }

  String? _defaultValidator(String? value) {
    if (value != null) {
      final emailAddressPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (emailAddressPattern.hasMatch(value)) {
        return null;
      } else {
        return 'Укажите почту хозяина';
      }
    }
    return null;
  }
}
