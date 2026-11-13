# MBarani Client

Cross-platform VPN client foundation built with Flutter and Dart.

- Platforms: Windows and Android
- UI: Flutter + Material 3
- Theme: Dark-first
- State management: Riverpod
- Navigation: GoRouter

> The initial UI uses demo data. It does not establish a real VPN connection.

## Prerequisites
- Flutter stable SDK
- Windows: Visual Studio 2022 with Desktop development with C++
- Android: Android Studio and Android SDK

## Generate native runners
From repository root, run on Windows PowerShell:

```powershell
.\scripts\bootstrap-platforms.ps1
```

The script generates Windows and Android runner folders using the installed Flutter SDK without overwriting existing platform folders.

## Run
```powershell
cd apps/client
flutter pub get
flutter run -d windows
```

For Android:
```powershell
flutter devices
flutter run -d <device-id>
```

## Current scope
- [x] Flutter application foundation
- [x] Dark design system
- [x] Responsive navigation
- [x] Dashboard with explicit demo state
- [x] Configuration, server, and settings screens
- [ ] Shared domain models and persistence
- [ ] Android native VPN adapter
- [ ] Windows connection engine adapter
- [ ] Integration and device tests

See `docs/ARCHITECTURE.md` and `docs/EXECUTION_PLAN.md`.
