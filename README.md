# hero_ui

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Mix Atlas capture

Hero UI commits a generated Button capture under `atlas/hero_ui`. The producer
renders the real `HeroButton` across every public variant, size, interaction
state, and light/dark theme, then packages canonical protocol documents with
content hashes.

```sh
# Regenerate rendered and protocol artifacts.
fvm dart run tool/atlas.dart

# Verify committed artifacts without rewriting them (suitable for CI).
fvm dart run tool/atlas.dart --check
```

Run `--check` on macOS in CI when rendered golden drift must be enforced;
protocol JSON and capture integrity are portable, but image bytes are not.

The capture intentionally records unsupported portable primitives as structured
diagnostics instead of substituting invented behavior.
