import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/ui/models/form_model.dart';
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
  late FormModel _formModel;
  String? _errorText;
  int _callCount = 0;
  bool _formFieldIsReady = false;

  void _updateStatus(String value) {
    _errorText = widget.validator!(value);
    _formFieldIsReady = _errorText == null && widget.controller.text.isNotEmpty;
    _formModel.addData(hashCode, _formFieldIsReady);
  }

  void _onFocus() {
    if (_focusNode.runtimeType == FocusNode) {
      if (!_focusNode.hasFocus) {
        _updateStatus(widget.controller.text);
      }
    } else {
      if (_callCount < 2) {
        _callCount++;
        return;
      }
      _updateStatus(widget.controller.text);
    }

    setState(() {
      widget.controller.text = widget.controller.text.trim();
    });
  }

  @override
  void initState() {
    super.initState();
    _formModel = Provider.of<FormModel>(context, listen: false);
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocus);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _formModel.addData(hashCode, _formFieldIsReady);
    });
  }

  @override
  void dispose() {
    super.dispose();
    Future.delayed(Duration.zero, () {
      _formModel.removeData(hashCode);
    });
    widget.controller.dispose();
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formModel = context.watch<FormModel>();

    return TextFormField(
      enabled: formModel.formSubmitted ? false : true,
      onChanged: (value) {
        _errorText = widget.validator!(value);
        _formFieldIsReady =
            _errorText == null && widget.controller.text.isNotEmpty;
      },
      onTap: formModel.formSubmitted ? null : widget.onTap,
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
