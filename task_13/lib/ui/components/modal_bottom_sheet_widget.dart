import 'package:flutter/material.dart';

import '../../common/extensions.dart';
import '../managers/theme_provider.dart';
import '../themes/app_theme.dart';
import '../themes/color_palettes.dart';
import 'palette_colors_element_widget.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  const ModalBottomSheetWidget({
    super.key,
  });

  @override
  State<ModalBottomSheetWidget> createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  late ThemeProvider themeProvider;
  AppTheme? _appTheme;
  late ThemeMode _themeMode;

  void _onClose() {
    Navigator.of(context).pop(_appTheme);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeProvider = ThemeProvider.of(context);
    _themeMode = themeProvider.state.currentThemeMode;
    _appTheme = themeProvider.state.currentAppTheme;
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
                                _appTheme = AppTheme.system;
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
                        Text(
                          'Цветовая схема',
                          style: TextStyle(
                            color: context.color.mutedForeground,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 64,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: PaletteColorsElementWidget<AppTheme>(
                                  value: AppTheme.light1,
                                  isSelected: _appTheme == AppTheme.light1 &&
                                      _themeMode == ThemeMode.light,
                                  onChanged: (value) {
                                    setState(() {
                                      _appTheme = value;
                                    });
                                  },
                                  palette: ColorPalettes.palette1,
                                  elementNumber: 1,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: PaletteColorsElementWidget<AppTheme>(
                                  value: AppTheme.light2,
                                  isSelected: _appTheme == AppTheme.light2 &&
                                      _themeMode == ThemeMode.light,
                                  onChanged: (value) {
                                    setState(() {
                                      _appTheme = value;
                                    });
                                  },
                                  palette: ColorPalettes.palette2,
                                  elementNumber: 2,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: PaletteColorsElementWidget<AppTheme>(
                                  value: AppTheme.light3,
                                  isSelected: _appTheme == AppTheme.light3 &&
                                      _themeMode == ThemeMode.light,
                                  onChanged: (value) {
                                    setState(() {
                                      _appTheme = value;
                                    });
                                  },
                                  palette: ColorPalettes.palette3,
                                  elementNumber: 3,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Цветовая схема',
                        style: TextStyle(color: context.color.mutedForeground),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 64,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PaletteColorsElementWidget<AppTheme>(
                              value: AppTheme.dark1,
                              isSelected: _appTheme == AppTheme.dark1 &&
                                  _themeMode == ThemeMode.dark,
                              onChanged: (value) {
                                setState(() {
                                  _appTheme = value;
                                });
                              },
                              palette: ColorPalettes.palette1,
                              elementNumber: 1,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: PaletteColorsElementWidget<AppTheme>(
                              value: AppTheme.dark2,
                              isSelected: _appTheme == AppTheme.dark2 &&
                                  _themeMode == ThemeMode.dark,
                              onChanged: (value) {
                                setState(() {
                                  _appTheme = value;
                                });
                              },
                              palette: ColorPalettes.palette2,
                              elementNumber: 2,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: PaletteColorsElementWidget<AppTheme>(
                              value: AppTheme.dark3,
                              isSelected: _appTheme == AppTheme.dark3 &&
                                  _themeMode == ThemeMode.dark,
                              onChanged: (value) {
                                setState(() {
                                  _appTheme = value;
                                });
                              },
                              palette: ColorPalettes.palette3,
                              elementNumber: 3,
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
