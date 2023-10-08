import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes/app_colors.dart';
import '../../themes/extensions.dart';

class DateFormFieldWidget extends StatefulWidget {
  const DateFormFieldWidget({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final String? Function(String?)? validator;

  @override
  State<DateFormFieldWidget> createState() => _DateFormFieldWidgetState();
}

class _DateFormFieldWidgetState extends State<DateFormFieldWidget> {
  final TextInputType _keyboardType = TextInputType.datetime;
  late final TextEditingController _controller;
  late final String? Function(String?)? _validator;
  late FocusNode _focusNode;
  String? _errorText;

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

  Future<void> _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    );

    if (picked != null) {
      _controller.text = DateFormat('dd.MM.yyyy').format(picked);
    }
  }

  void _onFocus() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _errorText = _validator!(_controller.text);
        _controller.text = _controller.text.trim();
      });
    } else {
      setState(() {
        _errorText = null;
        _controller.text = _controller.text.trim();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = _NoKeyboardEditableTextFocusNode();
    _focusNode.addListener(_onFocus);
    _validator = widget.validator ?? _defaultValidator;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _showDatePicker(),
      keyboardType: _keyboardType,
      controller: _controller,
      cursorColor: AppColors.darkGrey,
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: _errorText,
        labelStyle: _errorText == null
            ? context.textFieldTheme.defaultLabelStyle
            : context.textFieldTheme.errorLabelStyle,
        errorStyle: context.textFieldTheme.errorTextStyle,
      ),
      style: _errorText == null
          ? context.textFieldTheme.defaultInputStyle
          : context.textFieldTheme.errorInputStyle,
      validator: _validator,
    );
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
