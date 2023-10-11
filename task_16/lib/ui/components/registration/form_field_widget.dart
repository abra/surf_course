import 'package:flutter/material.dart';

import '/ui/themes/app_colors.dart';
import '/ui/themes/extensions.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.focusNode,
    this.onTap,
  });

  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final VoidCallback? onTap;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  late final FocusNode _focusNode;
  String? _errorText;
  int _callCount = 0;

  void _onFocus() {
    // TODO: Очень пахнущий код, надо пофиксить
    if (_focusNode.runtimeType == FocusNode) {
      if (!_focusNode.hasFocus) {
        _errorText = widget.validator!(widget.controller.text);
        setState(() {
          widget.controller.text = widget.controller.text.trim();
        });
      } else {
        _errorText = null;
        setState(() {
          widget.controller.text = widget.controller.text.trim();
        });
      }
    } else {
      if (_callCount < 2) {
        _callCount++;
        return;
      }
      _errorText = widget.validator!(widget.controller.text);
      setState(() {
        widget.controller.text = widget.controller.text.trim();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocus);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: _focusNode,
      cursorColor: AppColors.darkGrey,
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
      validator: widget.validator,
    );
  }
}
