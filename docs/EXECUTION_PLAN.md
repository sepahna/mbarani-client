# Execution Plan

## M0 — Repository and architecture
- Create separate GitHub repository.
- Add engineering instructions.
- Confirm Flutter stable toolchain and platform build prerequisites.
- Record engine candidates and licensing constraints.

## M1 — Flutter foundation
- Generate Windows and Android runners.
- Establish app bootstrap, routing, theme, localization direction, and linting.
- Add responsive navigation.

## M2 — UI foundation
- Implement dashboard and primary navigation.
- Add configurations, server, and settings screens.
- Mark demo placeholders explicitly.
- Review RTL/LTR and narrow/wide layouts.

## M3 — Shared domain and data
- Define profile/configuration models.
- Implement tested parser/import/export.
- Add persistence and schema migrations.
- Define typed connection/statistics contracts.

## M4 — Android adapter
- Review Android core and service boundaries.
- Build Kotlin bridge and permission flow.
- Verify connection lifecycle on physical devices.
- Do not modify the legacy Android repository without separate authorization.

## M5 — Windows adapter
- Perform native engine feasibility spike.
- Document installation, permissions, process/service lifecycle, and updates.
- Implement typed IPC and recovery.
- Verify on supported Windows versions.

## M6 — Release readiness
- Unit, widget, integration, and platform tests.
- Security/privacy review.
- Windows packaging and Android release build.
- Versioning, release notes, and reproducible CI.

## Acceptance gates
A UI compile alone does not complete a milestone. Platform connection milestones require real OS/device verification and evidence.
