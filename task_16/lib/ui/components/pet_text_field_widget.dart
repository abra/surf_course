import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../themes/app_colors.dart';
import '../themes/extensions.dart';

class PetTextFieldWidget extends StatefulWidget {
  const PetTextFieldWidget({
    super.key,
    required this.label,
    required this.validator,
    required this.keyboardType,
  });

  final String label;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  @override
  State<PetTextFieldWidget> createState() => _PetTextFieldWidgetState();
}

class _PetTextFieldWidgetState extends State<PetTextFieldWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  String? _errorText;

  void _onFocus() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _errorText = widget.validator!(_controller.text);
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
    _focusNode = widget.keyboardType == TextInputType.datetime
        ? NoKeyboardEditableTextFocusNode()
        : FocusNode();
    _focusNode.addListener(_onFocus);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.keyboardType == TextInputType.datetime
          ? () => _showDatePicker()
          : null,
      keyboardType: widget.keyboardType,
      controller: _controller,
      cursorColor: AppColors.darkGrey,
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: _errorText,
        labelStyle: _errorText == null
            ? context.petTextFieldTheme.defaultLabelStyle
            : context.petTextFieldTheme.errorLabelStyle,
        errorStyle: context.petTextFieldTheme.errorTextStyle,
      ),
      style: _errorText == null
          ? context.petTextFieldTheme.defaultInputStyle
          : context.petTextFieldTheme.errorInputStyle,
      validator: widget.validator,
    );
  }
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;

  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
