import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';

class ConfigurationsScreen extends StatelessWidget {
  const ConfigurationsScreen({super.key});

  @override
  Widget build(BuildContext context) => _FeaturePage(
        eyebrow: 'YOUR CONNECTIONS',
        title: 'Configurations',
        description: 'Import and organize your connection profiles.',
        child: const Column(children: [
          _InfoRow(
            icon: Icons.add_link_rounded,
            title: 'Import configuration',
            subtitle: 'Support for URI, QR, and file import will be added in the next milestone.',
          ),
          SizedBox(height: 10),
          _InfoRow(
            icon: Icons.folder_open_rounded,
            title: 'No profiles yet',
            subtitle: 'Your imported profiles will be listed here.',
          ),
        ]),
      );
}

class _FeaturePage extends StatelessWidget {
  const _FeaturePage({required this.eyebrow, required this.title, required this.description, required this.child});
  final String eyebrow;
  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(eyebrow, style: const TextStyle(color: AppColors.muted, fontSize: 11, letterSpacing: 1.5)),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(color: AppColors.muted)),
            const SizedBox(height: 26),
            child,
          ]),
        )),
      );
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(children: [
          Icon(icon, color: AppColors.primary, size: 25),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 5),
            Text(subtitle, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
          ])),
        ]),
      );
}
