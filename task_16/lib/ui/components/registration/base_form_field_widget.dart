import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/extensions.dart';

class BaseFormFieldWidget extends StatefulWidget {
  const BaseFormFieldWidget({
    super.key,
    required this.label,
    required this.keyboardType,
    this.validator,
    this.focusNode,
    this.controller,
    this.onTap,
  });

  final String label;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  @override
  State<BaseFormFieldWidget> createState() => _BaseFormFieldWidgetState();
}

class _BaseFormFieldWidgetState extends State<BaseFormFieldWidget> {
  late final String? Function(String?)? _validator;
  late FocusNode _focusNode;
  String? _errorText;

  void _onFocus() {
    if (!_focusNode.hasFocus && widget.controller != null) {
      setState(() {
        _errorText = _validator!(widget.controller!.text);
        widget.controller!.text = widget.controller!.text.trim();
      });
    } else {
      setState(() {
        _errorText = null;
        widget.controller!.text = widget.controller!.text.trim();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _validator = widget.validator;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocus);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.dispose();
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
      validator: _validator,
    );
  }
}
