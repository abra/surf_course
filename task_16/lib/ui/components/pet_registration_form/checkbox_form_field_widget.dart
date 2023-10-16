import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/ui/form_model.dart';
import '/ui/themes/extensions.dart';

class CheckboxFormFieldWidget extends StatelessWidget {
  const CheckboxFormFieldWidget({
    super.key,
    required this.isVaccinated,
    required this.onChanged,
    required this.label,
    required this.child,
  });

  final bool isVaccinated;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final formModel = context.watch<FormModel>();

    return GestureDetector(
      onTap: formModel.formSubmitted ? null : () => onChanged(!isVaccinated),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Opacity(
                    opacity: formModel.formSubmitted ? 0.5 : 1.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.iconColors.inActiveBg,
                        borderRadius: BorderRadius.circular(8),
                        border: null,
                      ),
                      child: Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          value: isVaccinated,
                          onChanged: formModel.formSubmitted ? null : onChanged,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            AnimatedOpacity(
              opacity: isVaccinated ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Visibility(
                visible: isVaccinated,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    child,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
