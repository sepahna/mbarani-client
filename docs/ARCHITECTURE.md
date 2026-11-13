# Architecture

## Product shape
A shared Flutter application provides presentation and platform-independent application logic. VPN execution is delegated to native platform adapters.

```text
Flutter UI
   |
Application / Use Cases
   |
Domain Contracts
   |
Platform Adapter Interface
   |-----------------------|
Android Adapter        Windows Adapter
Kotlin / VPNService    Windows-compatible engine
   |                       |
Android Core            Windows Core
```

## Layers
- Presentation: screens, widgets, design tokens, navigation, accessibility.
- Application: coordinates connect, disconnect, import, subscription update, and profile selection.
- Domain: platform-independent entities and contracts; no Flutter UI or native implementation dependencies.
- Data: repositories, persistence, parsers, and subscription sources.
- Platform adapters: permissions, native lifecycle, tunnel startup/shutdown, and diagnostics.

## Initial package strategy
Keep the first implementation in `apps/client` until domain and platform contracts stabilize. Extract packages only when useful:
- `packages/design_system`
- `packages/core_domain`
- `packages/core_data`
- `packages/config_parser`
- `packages/platform_bridge`

## Target connection contract
Define typed operations for permission request, connect(profileId), disconnect(), connection-state stream, traffic-statistics stream, and diagnostics. Represent permission-required, connecting, connected, reconnecting, disconnecting, disconnected, and error states.

The starter UI uses demo state; it is not a VPN implementation.

## Native integration
### Android
- Kotlin adapter and Android `VpnService`
- Explicit permission flow and foreground-service lifecycle
- Integrate an existing engine only after compatibility and license review

### Windows
- Windows adapter
- Select a Windows-compatible engine after a technical spike
- Controlled process lifecycle and IPC
- Document driver/service/privilege requirements before implementation

## Security
Do not expose secrets in diagnostics. Treat imported profiles as untrusted. Validate native IPC messages and lifecycle transitions.
