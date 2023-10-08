import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/extensions.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final String? Function(String?)? validator;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final TextInputType _keyboardType = TextInputType.text;
  late final TextEditingController _controller;
  late final String? Function(String?)? _validator;
  late FocusNode _focusNode;
  String? _errorText;

  String? _defaultValidator(String? value) {
    value = value!.trim();
    if (value.isEmpty || value.length < 3 || value.length >= 20) {
      return 'Укажите имя питомца от 3 до 20 символов';
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
