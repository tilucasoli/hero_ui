import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../components/button/hero_button.dart';
import '../../components/checkbox/hero_checkbox.dart';
import '../../components/divider/hero_divider.dart';
import '../../components/link_button/hero_link_button.dart';
import '../../components/link_button/hero_link_button_style.dart';
import '../../components/text_field/hero_text_field.dart';
import '../../tokens/hero_tokens.dart';

typedef OnSignInCallback =
    void Function(String email, String password, bool rememberMe);

final class AuthBlock extends StatefulWidget {
  final Widget brandingPanel;
  final OnSignInCallback? onSignIn;
  final VoidCallback? onSignInWithGoogle;
  final VoidCallback? onSignInWithApple;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onSignUp;

  const AuthBlock({
    super.key,
    this.brandingPanel = const AuthBrandingPanel(),
    this.onSignIn,
    this.onSignInWithGoogle,
    this.onSignInWithApple,
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
    final container = FlexBoxStyler()
        .color($surface())
        .alignment(.center)
        .onMobile(.column());
    final isMobile = ContextVariant.mobile().shouldApply(context);
    return container(
      children: [
        if (!isMobile) Expanded(child: widget.brandingPanel),
        Expanded(child: _buildFormPanel()),
      ],
    );
  }

  Widget _buildFormPanel() {
    final panelStyle = BoxStyler()
        .color($surface())
        .alignment(.center)
        .paddingAll(24);

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
                  style: TextStyler()
                      .style($titleH4.mix())
                      .color($foreground()),
                ),
                StyledText(
                  'Enter your credentials to access your account',
                  style: TextStyler()
                      .style($paragraphSmall.mix())
                      .color($muted()),
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
                      style: TextStyler()
                          .style($labelSmall.mix())
                          .color($foreground()),
                    ),
                  ],
                ),
                HeroLinkButton(
                  label: 'Forgot password?',
                  onPressed: widget.onForgotPassword,
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

            const HeroDivider(label: 'or continue with'),

            // Social login buttons
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: HeroButton(
                    variant: HeroButtonVariant.outline,
                    iconLeft: Icons.g_translate,
                    label: 'Google',
                    fullWidth: true,
                    onPressed: widget.onSignInWithGoogle,
                  ),
                ),
                Expanded(
                  child: HeroButton(
                    variant: HeroButtonVariant.outline,
                    iconLeft: Icons.apple,
                    label: 'Apple',
                    fullWidth: true,
                    onPressed: widget.onSignInWithApple,
                  ),
                ),
              ],
            ),

            // Sign up link
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  StyledText(
                    "Don't have an account?",
                    style: TextStyler()
                        .style($paragraphSmall.mix())
                        .color($muted()),
                  ),
                  HeroLinkButton(
                    label: 'Sign up',
                    size: HeroLinkButtonSize.sm,
                    onPressed: widget.onSignUp,
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

final class AuthBrandingPanel extends StatelessWidget {
  const AuthBrandingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final brandingStyle = BoxStyler()
        .color($accent())
        .alignment(.bottomLeft)
        .paddingAll(48)
        .marginAll(16)
        .borderRounded(16);

    return brandingStyle(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          StyledText(
            'Welcome back',
            style: TextStyler()
                .style($titleH3.mix())
                .color($accentForeground()),
          ),
          StyledText(
            'Sign in to continue to your account\nand explore what\'s new.',
            style: TextStyler()
                .style($paragraphMedium.mix())
                .color($accentForeground()),
          ),
        ],
      ),
    );
  }
}
