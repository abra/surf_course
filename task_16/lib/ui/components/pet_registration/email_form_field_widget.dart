import 'package:flutter/material.dart';

import '../../themes/extensions.dart';
import '../../themes/app_colors.dart';

class EmailFormFieldWidget extends StatefulWidget {
  const EmailFormFieldWidget({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final String? Function(String?)? validator;

  @override
  State<EmailFormFieldWidget> createState() => _EmailFormFieldWidgetState();
}

class _EmailFormFieldWidgetState extends State<EmailFormFieldWidget> {
  late final TextEditingController _controller;
  late final String? Function(String?)? _validator;
  final TextInputType _keyboardType = TextInputType.text;
  late FocusNode _focusNode;
  String? _errorText;

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
            ? context.petTextFieldTheme.defaultLabelStyle
            : context.petTextFieldTheme.errorLabelStyle,
        errorStyle: context.petTextFieldTheme.errorTextStyle,
      ),
      style: _errorText == null
          ? context.petTextFieldTheme.defaultInputStyle
          : context.petTextFieldTheme.errorInputStyle,
      validator: _validator,
    );
  }
}
