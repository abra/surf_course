import 'package:flutter/material.dart';

import '../components/custom_radio_button_widget.dart';
import '../managers/theme_provider.dart';
import '../themes/app_theme_mode.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  const ModalBottomSheetWidget({
    super.key,
  });

  @override
  State<ModalBottomSheetWidget> createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  AppThemeMode? _appTheme;
  late ThemeMode _themeMode;

  void _onClose() {
    Navigator.of(context).pop(_appTheme);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeMode = ThemeProvider.of(context).currentThemeMode;
    _appTheme = ThemeProvider.of(context).currentAppTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Center(
                child: Container(
                  width: 24,
                  height: 4,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Тема оформления',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      child: const Icon(Icons.close, size: 24),
                      onTap: () => _onClose(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: RadioListTile<ThemeMode>(
                            contentPadding: EdgeInsets.zero,
                            value: ThemeMode.system,
                            selected: _themeMode == ThemeMode.system,
                            groupValue: _themeMode,
                            onChanged: (ThemeMode? value) {
                              if (value != null) {
                                setState(() {
                                  _themeMode = value;
                                });
                                _appTheme = AppThemeMode.system;
                              }
                            },
                            title: Text(
                              'Системная',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: RadioListTile<ThemeMode>(
                            contentPadding: EdgeInsets.zero,
                            value: ThemeMode.light,
                            selected: _themeMode == ThemeMode.light,
                            groupValue: _themeMode,
                            onChanged: (ThemeMode? value) {
                              if (value != null) {
                                setState(() {
                                  _themeMode = value;
                                });
                              }
                            },
                            title: Text(
                              'Светлая',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _themeMode == ThemeMode.light ? true : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Цветовая схема'),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 64,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomRadioButton<AppThemeMode>(
                                  value: AppThemeMode.light1,
                                  color: Colors.blueGrey,
                                  isSelected: _appTheme == AppThemeMode.light1 &&
                                      _themeMode == ThemeMode.light,
                                  onChanged: (value) {
                                    setState(() {
                                      _appTheme = value;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomRadioButton<AppThemeMode>(
                                  value: AppThemeMode.light2,
                                  color: Colors.brown,
                                  isSelected: _appTheme == AppThemeMode.light2 &&
                                      _themeMode == ThemeMode.light,
                                  onChanged: (value) {
                                    setState(() {
                                      _appTheme = value;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomRadioButton<AppThemeMode>(
                                  value: AppThemeMode.light3,
                                  color: Colors.teal,
                                  isSelected: _appTheme == AppThemeMode.light3 &&
                                      _themeMode == ThemeMode.light,
                                  onChanged: (value) {
                                    setState(() {
                                      _appTheme = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: RadioListTile<ThemeMode>(
                            contentPadding: EdgeInsets.zero,
                            value: ThemeMode.dark,
                            selected: _themeMode == ThemeMode.dark,
                            groupValue: _themeMode,
                            onChanged: (ThemeMode? value) {
                              if (value != null) {
                                setState(() {
                                  _themeMode = value;
                                });
                              }
                            },
                            title: Text(
                              'Темная',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: _themeMode == ThemeMode.dark ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Цветовая схема'),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 64,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomRadioButton<AppThemeMode>(
                              value: AppThemeMode.dark1,
                              color: Colors.red,
                              isSelected: _appTheme == AppThemeMode.dark1 &&
                                  _themeMode == ThemeMode.dark,
                              onChanged: (value) {
                                setState(() {
                                  _appTheme = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomRadioButton<AppThemeMode>(
                              value: AppThemeMode.dark2,
                              color: Colors.orange,
                              isSelected: _appTheme == AppThemeMode.dark2 &&
                                  _themeMode == ThemeMode.dark,
                              onChanged: (value) {
                                setState(() {
                                  _appTheme = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomRadioButton<AppThemeMode>(
                              value: AppThemeMode.dark3,
                              color: Colors.lightGreen,
                              isSelected: _appTheme == AppThemeMode.dark3 &&
                                  _themeMode == ThemeMode.dark,
                              onChanged: (value) {
                                setState(() {
                                  _appTheme = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: () => _onClose(),
                    child: const Text('Готово'),
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ],
    );
  }
}
