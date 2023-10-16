import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/ui/models/form_model.dart';
import '/ui/themes/extensions.dart';

class SubmitFormButtonWidget extends StatefulWidget {
  const SubmitFormButtonWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<SubmitFormButtonWidget> createState() => _SubmitFormButtonWidgetState();
}

class _SubmitFormButtonWidgetState extends State<SubmitFormButtonWidget> {
  bool _isSending = false;

  Future<void> _sendData() async {
    setState(() {
      _isSending = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSending = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Consumer<FormModel>(
        builder: (context, formModel, _) {
          return ElevatedButton(
            style: formModel.isReadyForSubmit && _isSending == false
                ? context.elevatedButtonTheme.active.style
                : context.elevatedButtonTheme.inActive.style,
            onPressed: formModel.isReadyForSubmit && _isSending == false
                ? () async {
                    if (widget.formKey.currentState!.validate()) {
                      formModel.isSubmitted = true;
                      formModel.isReadyForSubmit = false;
                      await _sendData();
                      formModel.isSubmitted = false;
                      formModel.isReadyForSubmit = true;
                    }
                  }
                : null,
            child: _isSending
                ? SizedBox.square(
                    dimension: 24,
                    child: CircularProgressIndicator(
                      color: context.iconColors.inActiveBg,
                    ),
                  )
                : const Text('Отправить'),
          );
        },
      ),
    );
  }
}
