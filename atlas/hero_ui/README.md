# Hero UI Atlas current-only example

This capture intentionally exists only on the Hero UI Remix update branch.
`main` has no `atlas/hero_ui/capture.json`, so Mix Atlas opens the current
capture and displays a **Baseline unavailable** receipt.

Use these fields in Mix Atlas:

```text
repository: leoafarias/hero_ui
baseline:   main
current:    leoafarias/hero-ui-remix-1.0-branch
manifest:   atlas/hero_ui/capture.json
```

The capture contains one real Hero Button example:

- recipe: `primary-md`
- state: `default`
- theme: `light`
- declared evidence: a token-backed `FlexBoxStyler` container projection
- rendered evidence: a producer-generated Hero Button PNG

The README is intentionally not indexed by `capture.json`; only validated
capture artifacts are fetched by the viewer.
