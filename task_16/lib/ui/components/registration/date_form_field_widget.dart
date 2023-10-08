import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'form_field_widget.dart';

class DateFormFieldWidget extends StatelessWidget {
  const DateFormFieldWidget({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return FormFieldWidget(
      label: label,
      keyboardType: TextInputType.datetime,
      validator: validator ?? _defaultValidator,
      focusNode: _NoKeyboardEditableTextFocusNode(),
      controller: controller,
      onTap: () => _showDatePicker(context, controller),
    );
  }

  String? _defaultValidator(String? value) {
    if (value != null) {
      final datePattern = RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
      if (datePattern.hasMatch(value)) {
        return null;
      } else {
        return 'Укажите дату рождения питомца';
      }
    }
    return null;
  }

  Future<void> _showDatePicker(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    );

    if (pickedDate != null) {
      controller.text = DateFormat('dd.MM.yyyy').format(pickedDate);
    }
  }
}

class _NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;

  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
