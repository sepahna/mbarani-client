import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_theme.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.location, required this.child, super.key});

  final String location;
  final Widget child;

  static const _items = <_NavItem>[
    _NavItem('Overview', '/', Icons.grid_view_rounded),
    _NavItem('Configurations', '/configurations', Icons.layers_rounded),
    _NavItem('Servers', '/servers', Icons.dns_rounded),
    _NavItem('Settings', '/settings', Icons.tune_rounded),
  ];

  int get _selectedIndex {
    final index = _items.indexWhere((item) => item.path == location);
    return index < 0 ? 0 : index;
  }

  void _navigate(BuildContext context, int index) => context.go(_items[index].path);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 820;
          if (!isWide) {
            return Scaffold(
              body: SafeArea(child: child),
              bottomNavigationBar: NavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) => _navigate(context, index),
                destinations: _items
                    .map((item) => NavigationDestination(icon: Icon(item.icon), label: item.label))
                    .toList(),
              ),
            );
          }
          return Scaffold(
            body: SafeArea(
              child: Row(
                children: [
                  Container(
                    width: 244,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _BrandHeader(),
                        const SizedBox(height: 36),
                        const Text('WORKSPACE', style: TextStyle(
                          color: AppColors.muted, fontSize: 10, letterSpacing: 1.5,
                          fontWeight: FontWeight.w700,
                        )),
                        const SizedBox(height: 12),
                        for (var i = 0; i < _items.length; i++)
                          _SidebarItem(
                            item: _items[i],
                            selected: i == _selectedIndex,
                            onTap: () => _navigate(context, i),
                          ),
                        const Spacer(),
                        const _DemoNotice(),
                      ],
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 20, 16),
                    child: child,
                  )),
                ],
              ),
            ),
          );
        },
      );
}

class _NavItem {
  const _NavItem(this.label, this.path, this.icon);
  final String label;
  final String path;
  final IconData icon;
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(colors: [AppColors.primary, AppColors.cyan]),
            ),
            child: const Icon(Icons.bolt_rounded, color: Color(0xFF08111D)),
          ),
          const SizedBox(width: 12),
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('mbarani', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
            Text('SECURE CONNECTION', style: TextStyle(
              color: AppColors.muted, fontSize: 9, letterSpacing: 1.2,
            )),
          ]),
        ],
      );
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({required this.item, required this.selected, required this.onTap});
  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Material(
          color: selected ? AppColors.primary.withValues(alpha: 0.14) : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(13),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
              child: Row(
                children: [
                  Icon(item.icon, size: 19, color: selected ? AppColors.primary : AppColors.muted),
                  const SizedBox(width: 12),
                  Text(item.label, style: TextStyle(
                    color: selected ? Colors.white : AppColors.muted,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  )),
                  if (selected) ...[
                    const Spacer(),
                    Container(width: 5, height: 5, decoration: const BoxDecoration(
                      color: AppColors.cyan, shape: BoxShape.circle,
                    )),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
}

class _DemoNotice extends StatelessWidget {
  const _DemoNotice();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.science_outlined, color: AppColors.warning, size: 18),
          SizedBox(width: 9),
          Expanded(child: Text('Preview mode\nConnection data is simulated.',
            style: TextStyle(color: AppColors.muted, fontSize: 11))),
        ]),
      );
}
