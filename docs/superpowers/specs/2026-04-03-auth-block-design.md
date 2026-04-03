# Auth Block Design

## Overview

A split-screen login page block that showcases HeroUI components working together. Lives under `lib/src/blocks/auth/` as the first entry in a new "Blocks" category — ready-made compositions users can copy and adapt.

## Layout

Full-screen horizontal split (50/50):

- **Left panel** — Accent-colored background (`$accent`), vertically centered. Contains a "Welcome back" title and a subtitle, both in `$accentForeground`. Styled entirely with Mix.
- **Right panel** — Surface background (`$surface`), vertically and horizontally centered. Contains the login form in a max-width constrained column.

## Form Contents (top to bottom)

1. **Heading** — "Sign In", large bold text in `$foreground`
2. **Subtitle** — "Enter your credentials to access your account" in `$muted`
3. **Email field** — `HeroTextField(label: "Email", hintText: "you@example.com", fullWidth: true)`
4. **Password field** — `HeroTextField(label: "Password", obscureText: true, fullWidth: true)`
5. **Options row** — Left: `HeroCheckbox` + "Remember me" label. Right: "Forgot password?" text button (`$accent` color)
6. **Submit button** — `HeroButton(variant: .primary, fullWidth: true, label: "Sign In")`
7. **Sign-up link** — "Don't have an account? **Sign up**" centered text at the bottom

## Widget API

```dart
final class AuthBlock extends StatefulWidget {
  final void Function(String email, String password, bool rememberMe)? onSignIn;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onSignUp;

  const AuthBlock({
    super.key,
    this.onSignIn,
    this.onForgotPassword,
    this.onSignUp,
  });
}
```

The widget manages its own `TextEditingController`s for email/password and a `bool` for the remember-me checkbox.

## Styling

- All colors derived from HeroUI theme tokens — automatically supports light and dark mode.
- Layout containers use Mix `Style` for padding, alignment, spacing, and colors.
- No hardcoded colors or sizes outside of the theme system.

## File Structure

```
lib/src/blocks/auth/auth_block.dart   — the StatefulWidget
```

No separate style file needed — the block composes existing styled components and uses inline Mix styles for layout containers only.

## Widgetbook Integration

Add a new "Blocks" `WidgetbookCategory` in `example/lib/widgetbook_app.dart` with:

- Component: "AuthBlock"
- Use case: "Playground" (no knobs needed — the block is self-contained)

## Scope

- Single file, single widget
- No new dependencies
- No new tokens or theme changes
- No routing, validation, or network logic — this is a visual block
