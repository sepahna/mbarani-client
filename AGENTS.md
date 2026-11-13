# MBarani Client — Engineering Instructions

These instructions apply to the entire repository.

## Product scope
Build a maintainable Flutter/Dart VPN client for Windows and Android. The existing `mbarani-android-ui` repository is separate and must not be modified unless a task explicitly authorizes it.

## Mandatory workflow
Before changing code:
1. Read this file and relevant scoped instructions.
2. Inspect repository structure, dependencies, relevant files, and Git status/diff in a local checkout.
3. Identify the owner of behavior before adding abstractions or duplicate state.
4. Prefer small, reversible changes and assess Windows and Android impact.

After changing code:
1. Run `dart format` on changed Dart files.
2. Run `flutter analyze`.
3. Run relevant unit/widget tests.
4. Run platform builds when the SDK/toolchain is available.
5. Report exact commands and results. Never claim verification that was not performed.

## Architecture
- Presentation: Flutter widgets, routing, themes, responsive UI, accessibility.
- Application: use cases and orchestration.
- Domain: platform-independent models and contracts.
- Data: repositories, persistence, parsers, remote sources.
- Platform adapters: native Android and Windows integrations.
- Shared Dart code must not depend on platform-specific implementation details.

## Platform boundaries
- Flutter UI must never implement a VPN tunnel directly.
- Android VPN lifecycle and permissions belong to the Android native adapter.
- Windows tunnel/process/network lifecycle belongs to the Windows adapter.
- Communicate through typed, versioned platform contracts.
- Handle permission denial, startup failure, process exit, reconnect, and restart.
- Never assume Android native libraries or binaries are compatible with Windows.

## Security
- Never log credentials, subscription URLs, private keys, full proxy URIs, or complete VPN configurations.
- Store secrets using platform-backed secure storage.
- Validate imported configuration and remote data.
- Avoid shell command construction from untrusted input.
- Treat downloaded profiles and metadata as untrusted.

## Data and compatibility
- Persisted model changes require migrations and regression tests.
- Configuration parsing must be deterministic and tested.
- Do not silently discard unknown fields during round-trip serialization.
- Clearly distinguish demo data from real connection state.

## UI and accessibility
- Dark mode is the initial product direction; centralize design tokens.
- Support RTL and LTR.
- Add semantic labels to icon-only controls.
- Support narrow mobile and wide desktop layouts.
- Avoid unnecessary animation and respect reduced-motion preferences where practical.

## Dependencies
- Add dependencies only for concrete needs.
- Prefer stable compatible releases.
- Document platform setup and licensing implications.
- Do not add generated/vendor native binaries without provenance and reproducible update instructions.

## Definition of done
A task is complete only after implementation, relevant tests, analysis, documentation, and platform impact have been checked. Clearly list anything not verified.
