import 'package:flutter/material.dart';

import '../components/modal_bottom_sheet_widget.dart';
import '../components/profile_element_widget.dart';
import '../managers/theme_provider.dart';
import '../themes/app_theme_mode.dart';
import '../themes/custom_theme_extensions.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final customThemeColors = Theme.of(context).extension<CustomThemeColors>()!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text('Профиль'),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Save'),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 28,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        const AssetImage('assets/images/profile.png'),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Мои награды',
                  style: TextStyle(
                    color: customThemeColors.profileElementTitle,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('🥇', style: TextStyle(fontSize: 32)),
                    SizedBox(width: 16),
                    Text('🥇', style: TextStyle(fontSize: 32)),
                    SizedBox(width: 16),
                    Text('🥉', style: TextStyle(fontSize: 32)),
                    SizedBox(width: 16),
                    Text('🥈', style: TextStyle(fontSize: 32)),
                    SizedBox(width: 16),
                    Text('🥉', style: TextStyle(fontSize: 32)),
                  ],
                ),
                const SizedBox(height: 24),
                const ProfileElementWidget(
                  title: 'Имя',
                  text: 'Маркус Хассельборг',
                ),
                const SizedBox(height: 8),
                const ProfileElementWidget(
                  title: 'Email',
                  text: 'MarkusHSS@gmail.com',
                ),
                const SizedBox(height: 8),
                const ProfileElementWidget(
                  title: 'Дата рождения',
                  text: '03.03.1986',
                ),
                const SizedBox(height: 8),
                ProfileElementWidget(
                  title: 'Команда',
                  text: 'Сборная Швеции',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                ProfileElementWidget(
                  title: 'Позиция',
                  text: 'Скип',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                ProfileElementWidget(
                  title: 'Тема оформления',
                  text: ThemeProvider.of(context).state.currentThemeModeName,
                  onTap: () async {
                    final theme = await _showModalBottomSheet(context);

                    if (theme != null && mounted) {
                      ThemeProvider.of(context).state.switchTheme(theme);
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<AppTheme?> _showModalBottomSheet(BuildContext context) async {
    final AppTheme? theme = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const ModalBottomSheetWidget();
      },
    );

    return theme;
  }
}
