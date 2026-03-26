import 'package:flutter/material.dart';
import 'package:hero_ui/hero_ui.dart';

void main() {
  runApp(const HeroUIDemo());
}

class HeroUIDemo extends StatelessWidget {
  const HeroUIDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeroUI Demo',
      home: HeroTheme.fromSeeds(
        accent: Colors.blue,
        danger: Colors.red,
        child: const Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Button Variants',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _VariantsDemo(),
                SizedBox(height: 32),
                Text(
                  'Button Sizes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _SizesDemo(),
                SizedBox(height: 32),
                Text(
                  'Icon Buttons',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _IconDemo(),
                SizedBox(height: 32),
                Text(
                  'Full Width',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _FullWidthDemo(),
                SizedBox(height: 32),
                Text(
                  'Button Group',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _ButtonGroupDemo(),
                SizedBox(height: 32),
                Text(
                  'Disabled',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _DisabledDemo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _VariantsDemo extends StatelessWidget {
  const _VariantsDemo();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Primary',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.secondary,
          label: 'Secondary',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.tertiary,
          label: 'Tertiary',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.outline,
          label: 'Outline',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.ghost,
          label: 'Ghost',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.danger,
          label: 'Danger',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.dangerSoft,
          label: 'Danger Soft',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _SizesDemo extends StatelessWidget {
  const _SizesDemo();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        HeroButton(
          variant: HeroButtonVariant.primary,
          size: HeroButtonSize.sm,
          label: 'Small',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.primary,
          size: HeroButtonSize.md,
          label: 'Medium',
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.primary,
          size: HeroButtonSize.lg,
          label: 'Large',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _IconDemo extends StatelessWidget {
  const _IconDemo();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Search',
          iconLeft: Icons.search,
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.secondary,
          label: 'Add Member',
          iconLeft: Icons.add,
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.danger,
          label: 'Delete',
          iconLeft: Icons.delete,
          onPressed: () {},
        ),
        HeroButton(
          variant: HeroButtonVariant.tertiary,
          isIconOnly: true,
          iconLeft: Icons.more_horiz,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _FullWidthDemo extends StatelessWidget {
  const _FullWidthDemo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          HeroButton(
            variant: HeroButtonVariant.primary,
            fullWidth: true,
            label: 'Primary Full Width',
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          HeroButton(
            variant: HeroButtonVariant.secondary,
            fullWidth: true,
            label: 'Secondary Full Width',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ButtonGroupDemo extends StatelessWidget {
  const _ButtonGroupDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Default tertiary group with separators
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(label: 'First', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Second', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Third', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 16),

        // Outline group
        HeroButtonGroup(
          variant: HeroButtonVariant.outline,
          children: [
            HeroButton(label: 'Left', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Center', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Right', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 16),

        // Navigation group
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(
              iconLeft: Icons.chevron_left,
              label: 'Previous',
              onPressed: () {},
            ),
            const HeroButtonGroupSeparator(),
            HeroButton(
              label: 'Next',
              iconRight: Icons.chevron_right,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Icon-only alignment group
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(
              isIconOnly: true,
              iconLeft: Icons.format_align_left,
              onPressed: () {},
            ),
            const HeroButtonGroupSeparator(),
            HeroButton(
              isIconOnly: true,
              iconLeft: Icons.format_align_center,
              onPressed: () {},
            ),
            const HeroButtonGroupSeparator(),
            HeroButton(
              isIconOnly: true,
              iconLeft: Icons.format_align_right,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Different sizes
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          size: HeroButtonSize.sm,
          children: [
            HeroButton(label: 'Small', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Group', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

class _DisabledDemo extends StatelessWidget {
  const _DisabledDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            HeroButton(
              variant: HeroButtonVariant.primary,
              label: 'Disabled',
              isDisabled: true,
              onPressed: () {},
            ),
            HeroButton(
              variant: HeroButtonVariant.primary,
              label: 'Loading',
              isLoading: true,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          isDisabled: true,
          children: [
            HeroButton(label: 'All', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'Disabled', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(
              label: 'Except Me',
              isDisabled: false,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
