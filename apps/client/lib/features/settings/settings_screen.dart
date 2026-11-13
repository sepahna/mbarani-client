import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('PREFERENCES', style: TextStyle(color: AppColors.muted, fontSize: 11, letterSpacing: 1.5)),
            const SizedBox(height: 10),
            const Text('Settings', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            const Text('Make MBarani work the way you do.', style: TextStyle(color: AppColors.muted)),
            const SizedBox(height: 24),
            const _SettingTile(icon: Icons.palette_outlined, title: 'Appearance',
              subtitle: 'Dark theme is currently enabled.', trailing: 'Dark'),
            const _SettingTile(icon: Icons.language_rounded, title: 'Language',
              subtitle: 'Persian and English localization will be configured here.', trailing: 'English'),
            const _SettingTile(icon: Icons.security_rounded, title: 'Privacy & security',
              subtitle: 'Secure storage and diagnostic preferences.', trailing: ''),
            const _SettingTile(icon: Icons.info_outline_rounded, title: 'About MBarani',
              subtitle: 'Cross-platform client preview.', trailing: '0.1.0'),
          ]),
        )),
      );
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({required this.icon, required this.title, required this.subtitle, required this.trailing});
  final IconData icon;
  final String title;
  final String subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: BorderRadius.circular(17),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(children: [
          Icon(icon, color: AppColors.primary, size: 23),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
          ])),
          if (trailing.isNotEmpty) Text(trailing, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
        ]),
      );
}
