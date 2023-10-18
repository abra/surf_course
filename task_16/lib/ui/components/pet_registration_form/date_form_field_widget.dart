import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/ui/components/pet_registration_form/nokeyboard_editable_text_focusnode.dart';
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
      focusNode: NoKeyboardEditableTextFocusNode(),
      validator: validator ?? _defaultValidator,
      controller: controller,
      onTap: () => _showDatePicker(context, controller),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) return 'Укажите дату';

    if (value.isNotEmpty) {
      // Проверяем что дата корректна (пример 10.10.2022)
      final datePattern = RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
      if (!datePattern.hasMatch(value)) return 'Укажите дату';

      // Проверяем что дата раньше текущей
      final date = DateFormat('dd.MM.yyyy').parse(value);
      final now = DateTime.now();
      final isToday = now.day == date.day &&
          now.month == date.month &&
          now.year == date.year;
      if (isToday) return 'Дата должна быть раньше текущей';
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
