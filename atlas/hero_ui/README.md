# Hero UI Atlas current-only example

This capture intentionally exists only on the Hero UI Remix update branch.
`main` has no `atlas/hero_ui/capture.json`, so Mix Atlas opens the current
capture and displays a **Baseline unavailable** receipt.

Use these fields in Mix Atlas:

```text
repository: tilucasoli/hero_ui
baseline:   main
current:    #21
manifest:   atlas/hero_ui/capture.json
```

Atlas resolves PR #21 to its immutable head commit in the
`leoafarias/hero_ui` fork. To open the fork branch directly instead, use
`leoafarias/hero_ui` with current ref
`leoafarias/hero-ui-remix-1.0-branch`.

The capture is generated from the real Hero Button API and contains:

- 21 recipes: all 7 public variants across `sm`, `md`, and `lg`
- 6 states: default, hovered, pressed, focused, disabled, and loading
- 2 themes: light and dark
- declared evidence: projected container, label, and icon Mix styles
- rendered evidence: producer-generated contact sheets from real widgets

Regenerate or verify the capture from the repository root:

```sh
fvm dart run tool/atlas.dart
fvm dart run tool/atlas.dart --check
```

Run the check on macOS when validating rendered goldens; JSON and package
integrity checks remain portable, but image bytes are platform-specific.

The custom Remix spinner and component-level animation/modifier behavior are
reported as structured protocol diagnostics where the portable viewer cannot
represent them exactly.

The README is intentionally not indexed by `capture.json`; only validated
capture artifacts are fetched by the viewer.
