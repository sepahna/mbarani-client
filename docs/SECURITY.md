# Security Notes

- Treat profiles, subscription URLs, imported files, and remote metadata as untrusted.
- Never log secrets or complete connection configurations.
- Use OS-backed secure storage for credentials and sensitive subscription material.
- Validate file size, encoding, schema, and supported protocol fields before import.
- Avoid executing user-controlled shell strings.
- Document the threat model before adding privileged Windows components or local IPC.
- Keep demo data visibly separate from live connection status.
