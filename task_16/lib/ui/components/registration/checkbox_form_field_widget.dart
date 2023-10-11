import 'package:flutter/material.dart';

import '/ui/themes/extensions.dart';

class CheckboxFormFieldWidget extends StatefulWidget {
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
  State<CheckboxFormFieldWidget> createState() =>
      _CheckboxFormFieldWidgetState();
}

class _CheckboxFormFieldWidgetState extends State<CheckboxFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.isVaccinated),
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
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.iconColors.inActiveBg,
                      borderRadius: BorderRadius.circular(8),
                      border: null,
                    ),
                    child: Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        value: widget.isVaccinated,
                        onChanged: widget.onChanged,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            AnimatedOpacity(
              opacity: widget.isVaccinated ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Visibility(
                visible: widget.isVaccinated,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    widget.child,
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
