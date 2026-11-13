import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme/app_theme.dart';

final demoConnectionProvider = StateProvider<bool>((ref) => false);

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connected = ref.watch(demoConnectionProvider);
    final width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopBar(),
              const SizedBox(height: 28),
              const Text('Your connection,', style: TextStyle(color: AppColors.muted, fontSize: 16)),
              const Text('under your control.', style: TextStyle(
                fontSize: 31, fontWeight: FontWeight.w800, letterSpacing: -0.8,
              )),
              const SizedBox(height: 22),
              _ConnectionCard(
                connected: connected,
                onPressed: () => ref.read(demoConnectionProvider.notifier).state = !connected,
              ),
              const SizedBox(height: 20),
              const Text('AT A GLANCE', style: TextStyle(
                color: AppColors.muted, fontSize: 11, letterSpacing: 1.5, fontWeight: FontWeight.w700,
              )),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: width >= 1100 ? 4 : (width >= 600 ? 2 : 1),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: width < 600 ? 3.3 : 2.1,
                children: const [
                  _MetricCard(title: 'Download', value: '0.0 KB/s', icon: Icons.south_rounded, tint: AppColors.cyan),
                  _MetricCard(title: 'Upload', value: '0.0 KB/s', icon: Icons.north_rounded, tint: AppColors.primary),
                  _MetricCard(title: 'Session', value: '00:00:00', icon: Icons.timer_outlined, tint: AppColors.success),
                  _MetricCard(title: 'Active profile', value: 'Not selected', icon: Icons.layers_outlined, tint: AppColors.warning),
                ],
              ),
              const SizedBox(height: 20),
              const _QuickInfo(),
              const SizedBox(height: 18),
              const Text('Demo interface — no VPN tunnel is started by this preview.',
                style: TextStyle(color: AppColors.muted, fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) => Row(children: [
        const Spacer(),
        IconButton(tooltip: 'Notifications', onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded)),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface, borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.border),
          ),
          child: const Row(children: [
            Icon(Icons.person_outline_rounded, size: 17),
            SizedBox(width: 7),
            Text('My workspace', style: TextStyle(fontSize: 12)),
          ]),
        ),
      ]);
}

class _ConnectionCard extends StatelessWidget {
  const _ConnectionCard({required this.connected, required this.onPressed});
  final bool connected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final accent = connected ? AppColors.success : AppColors.primary;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF1A2944), Color(0xFF111827), Color(0xFF101827)],
        ),
        border: Border.all(color: AppColors.border),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        final compact = constraints.maxWidth < 560;
        final content = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 9, height: 9, decoration: BoxDecoration(
              color: accent, shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: accent.withValues(alpha: 0.5), blurRadius: 10)],
            )),
            const SizedBox(width: 9),
            Text(connected ? 'CONNECTED (DEMO)' : 'NOT CONNECTED', style: TextStyle(
              color: accent, letterSpacing: 1.4, fontSize: 11, fontWeight: FontWeight.w800,
            )),
          ]),
          const SizedBox(height: 18),
          Text(connected ? 'You are in preview mode.' : 'Ready when you are.',
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
          const SizedBox(height: 7),
          const Text('Choose a profile and connect securely.',
            style: TextStyle(color: AppColors.muted, fontSize: 13)),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: onPressed,
            icon: Icon(connected ? Icons.stop_rounded : Icons.power_settings_new_rounded),
            label: Text(connected ? 'Simulate disconnect' : 'Preview connect'),
            style: FilledButton.styleFrom(
              backgroundColor: accent, foregroundColor: const Color(0xFF07111C),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
          ),
        ]);
        if (compact) return content;
        return Row(children: [
          Expanded(child: content),
          const SizedBox(width: 20),
          Container(
            width: 150, height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: accent.withValues(alpha: 0.22), width: 1.5),
              boxShadow: [BoxShadow(color: accent.withValues(alpha: 0.08), blurRadius: 42, spreadRadius: 12)],
            ),
            child: Icon(Icons.public_rounded, size: 72, color: accent.withValues(alpha: 0.85)),
          ),
        ]);
      }),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.title, required this.value, required this.icon, required this.tint});
  final String title;
  final String value;
  final IconData icon;
  final Color tint;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(children: [
          Container(width: 42, height: 42, decoration: BoxDecoration(
            color: tint.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(13),
          ), child: Icon(icon, color: tint, size: 20)),
          const SizedBox(width: 12),
          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(color: AppColors.muted, fontSize: 11)),
              const SizedBox(height: 5),
              Text(value, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            ])),
        ]),
      );
}

class _QuickInfo extends StatelessWidget {
  const _QuickInfo();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: const Row(children: [
          Icon(Icons.shield_moon_outlined, color: AppColors.cyan, size: 24),
          SizedBox(width: 13),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Privacy overview', style: TextStyle(fontWeight: FontWeight.w700)),
            SizedBox(height: 4),
            Text('Connection protection details will appear here when a native engine is integrated.',
              style: TextStyle(color: AppColors.muted, fontSize: 12)),
          ])),
          Icon(Icons.chevron_right_rounded, color: AppColors.muted),
        ]),
      );
}
