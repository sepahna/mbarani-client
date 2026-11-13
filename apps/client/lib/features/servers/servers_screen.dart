import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';

class ServersScreen extends StatelessWidget {
  const ServersScreen({super.key});

  @override
  Widget build(BuildContext context) => const _SimplePage(
        title: 'Servers',
        subtitle: 'Browse and organize your server locations.',
        icon: Icons.dns_rounded,
        message: 'Server discovery and latency testing will be implemented after the shared data contracts are ready.',
      );
}

class _SimplePage extends StatelessWidget {
  const _SimplePage({required this.title, required this.subtitle, required this.icon, required this.message});
  final String title;
  final String subtitle;
  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) => Center(child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, size: 54, color: AppColors.primary),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.muted)),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface, borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(message, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.muted)),
            ),
          ]),
        ),
      ));
}
