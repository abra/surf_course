import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/extensions.dart';

class NumberFormFieldWidget extends StatefulWidget {
  const NumberFormFieldWidget({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final String? Function(String?)? validator;

  @override
  State<NumberFormFieldWidget> createState() => _NumberFormFieldWidgetState();
}

class _NumberFormFieldWidgetState extends State<NumberFormFieldWidget> {
  final TextInputType _keyboardType = const TextInputType.numberWithOptions(
    decimal: true,
  );
  late final TextEditingController _controller;
  late final String? Function(String?)? _validator;
  late FocusNode _focusNode;
  String? _errorText;

  String? _defaultValidator(String? value) {
    value = value?.trim() ?? '';
    final number = double.tryParse(value) ?? 0;
    if (number <= 0) {
      return 'Укажите вес, больше 0 кг';
    }
    return null;
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
    _focusNode = FocusNode();
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
