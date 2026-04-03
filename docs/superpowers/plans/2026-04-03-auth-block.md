# Auth Block Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a split-screen auth/login block that composes HeroUI components (HeroCard, HeroTextField, HeroButton, HeroCheckbox) into a ready-made login page.

**Architecture:** Single `AuthBlock` StatefulWidget in `lib/src/blocks/auth/auth_block.dart`. Full-screen Row split 50/50: left branding panel (accent background, welcome text via Mix styles), right form panel (email, password, remember me, sign in, forgot password, sign up). Registered in widgetbook under a new "Blocks" category.

**Tech Stack:** Flutter, Mix (styling), Remix (components via HeroUI wrappers), Widgetbook (showcase)

---

## File Structure

| Action | Path | Responsibility |
|--------|------|----------------|
| Create | `lib/src/blocks/auth/auth_block.dart` | StatefulWidget composing the split-screen auth layout |
| Modify | `example/lib/widgetbook_app.dart` | Add "Blocks" category with AuthBlock playground |

---

### Task 1: Create the AuthBlock widget

**Files:**
- Create: `lib/src/blocks/auth/auth_block.dart`

- [ ] **Step 1: Create the AuthBlock file with imports, class shell, and State**

Create `lib/src/blocks/auth/auth_block.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../components/button/hero_button.dart';
import '../../components/button/hero_button_style.dart';
import '../../components/checkbox/hero_checkbox.dart';
import '../../components/text_field/hero_text_field.dart';
import '../../tokens/hero_tokens.dart';

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

  @override
  State<AuthBlock> createState() => _AuthBlockState();
}

class _AuthBlockState extends State<AuthBlock> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildBrandingPanel()),
        Expanded(child: _buildFormPanel()),
      ],
    );
  }

  Widget _buildBrandingPanel() {
    final brandingStyle = Style(
      $box.color($accent()),
      $box.alignment.center(),
      $box.padding.horizontal(48),
    );

    return Box(
      style: brandingStyle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          StyledText(
            'Welcome back',
            style: Style(
              $text.style.fontSize(40),
              $text.style.fontWeight.w700(),
              $text.style.color($accentForeground()),
            ),
          ),
          StyledText(
            'Sign in to continue to your account\nand explore what\'s new.',
            style: Style(
              $text.style.fontSize(16),
              $text.style.color($accentForeground()),
              $text.style.height(1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormPanel() {
    final panelStyle = Style(
      $box.color($surface()),
      $box.alignment.center(),
    );

    return Box(
      style: panelStyle,
      child: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            // Heading
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                StyledText(
                  'Sign In',
                  style: Style(
                    $text.style.fontSize(28),
                    $text.style.fontWeight.w700(),
                    $text.style.color($foreground()),
                  ),
                ),
                StyledText(
                  'Enter your credentials to access your account',
                  style: Style(
                    $text.style.fontSize(14),
                    $text.style.color($muted()),
                  ),
                ),
              ],
            ),

            // Email field
            HeroTextField(
              controller: _emailController,
              label: 'Email',
              hintText: 'you@example.com',
              fullWidth: true,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),

            // Password field
            HeroTextField(
              controller: _passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
              fullWidth: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleSignIn(),
            ),

            // Remember me + Forgot password row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    HeroCheckbox(
                      selected: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    StyledText(
                      'Remember me',
                      style: Style(
                        $text.style.fontSize(14),
                        $text.style.color($foreground()),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: widget.onForgotPassword,
                  child: StyledText(
                    'Forgot password?',
                    style: Style(
                      $text.style.fontSize(14),
                      $text.style.color($accent()),
                    ),
                  ),
                ),
              ],
            ),

            // Sign In button
            HeroButton(
              variant: HeroButtonVariant.primary,
              fullWidth: true,
              label: 'Sign In',
              onPressed: _handleSignIn,
            ),

            // Sign up link
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  StyledText(
                    "Don't have an account?",
                    style: Style(
                      $text.style.fontSize(14),
                      $text.style.color($muted()),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onSignUp,
                    child: StyledText(
                      'Sign up',
                      style: Style(
                        $text.style.fontSize(14),
                        $text.style.fontWeight.w600(),
                        $text.style.color($accent()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignIn() {
    widget.onSignIn?.call(
      _emailController.text,
      _passwordController.text,
      _rememberMe,
    );
  }
}
```

- [ ] **Step 2: Verify it compiles**

Run: `cd /Users/martinmichelini/conductor/workspaces/hero_ui/san-francisco && flutter analyze lib/src/blocks/auth/auth_block.dart`
Expected: No issues found

- [ ] **Step 3: Commit**

```bash
git add lib/src/blocks/auth/auth_block.dart
git commit -m "feat: add AuthBlock split-screen login widget"
```

---

### Task 2: Register AuthBlock in widgetbook

**Files:**
- Modify: `example/lib/widgetbook_app.dart`

- [ ] **Step 1: Add import and Blocks category to widgetbook**

In `example/lib/widgetbook_app.dart`, add the import at the top (after the existing hero_ui import):

```dart
import 'package:hero_ui/src/blocks/auth/auth_block.dart';
```

Then in the `directories` list of `Widgetbook.material(...)`, add a new `WidgetbookCategory` **after** the existing "Components" category:

```dart
WidgetbookCategory(
  name: 'Blocks',
  children: [
    WidgetbookComponent(
      name: 'AuthBlock',
      useCases: [
        WidgetbookUseCase(
          name: 'Playground',
          builder: (context) {
            return HeroTheme(
              data: Theme.of(context).brightness == Brightness.dark
                  ? HeroThemeData.dark()
                  : HeroThemeData.light(),
              child: const AuthBlock(),
            );
          },
        ),
      ],
    ),
  ],
),
```

Note: The AuthBlock is rendered full-screen, so we skip the `_preview` wrapper and provide its own `HeroTheme` so it fills the viewport.

- [ ] **Step 2: Verify it compiles**

Run: `cd /Users/martinmichelini/conductor/workspaces/hero_ui/san-francisco && flutter analyze example/lib/widgetbook_app.dart`
Expected: No issues found

- [ ] **Step 3: Commit**

```bash
git add example/lib/widgetbook_app.dart
git commit -m "feat: add AuthBlock to widgetbook under Blocks category"
```
