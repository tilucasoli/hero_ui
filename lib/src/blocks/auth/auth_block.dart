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
    final brandingStyle = BoxStyler()
        .color($accent())
        .alignment(.center)
        .paddingX(48);

    return Box(
      style: brandingStyle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          StyledText(
            'Welcome back',
            style: TextStyler()
                .fontSize(40)
                .fontWeight(.w700)
                .color($accentForeground()),
          ),
          StyledText(
            'Sign in to continue to your account\nand explore what\'s new.',
            style: TextStyler()
                .fontSize(16)
                .color($accentForeground())
                .height(1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildFormPanel() {
    final panelStyle = BoxStyler()
        .color($surface())
        .alignment(.center);

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
                      .fontSize(28)
                      .fontWeight(.w700)
                      .color($foreground()),
                ),
                StyledText(
                  'Enter your credentials to access your account',
                  style: TextStyler()
                      .fontSize(14)
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
                          .fontSize(14)
                          .color($foreground()),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: widget.onForgotPassword,
                  child: StyledText(
                    'Forgot password?',
                    style: TextStyler()
                        .fontSize(14)
                        .color($accent()),
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
                    style: TextStyler()
                        .fontSize(14)
                        .color($muted()),
                  ),
                  GestureDetector(
                    onTap: widget.onSignUp,
                    child: StyledText(
                      'Sign up',
                      style: TextStyler()
                          .fontSize(14)
                          .fontWeight(.w600)
                          .color($accent()),
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
