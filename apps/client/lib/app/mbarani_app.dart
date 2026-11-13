import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/configurations/configurations_screen.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/servers/servers_screen.dart';
import '../features/settings/settings_screen.dart';
import '../shared/layout/app_shell.dart';
import 'theme/app_theme.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(
        location: state.uri.path,
        child: child,
      ),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const DashboardScreen()),
        GoRoute(path: '/configurations', builder: (context, state) => const ConfigurationsScreen()),
        GoRoute(path: '/servers', builder: (context, state) => const ServersScreen()),
        GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
      ],
    ),
  ],
);

class MbaraniApp extends StatelessWidget {
  const MbaraniApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'MBarani',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        routerConfig: _router,
      );
}
