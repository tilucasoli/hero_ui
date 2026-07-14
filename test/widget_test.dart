import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:mix/mix.dart';

Widget wrapWithTheme(Widget child) {
  return MaterialApp(
    home: HeroTheme(
      data: HeroThemeData.light(),
      child: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('HeroButton', () {
    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButton(
            variant: HeroButtonVariant.primary,
            label: 'Click me',
            onPressed: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Click me'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButton(
            variant: HeroButtonVariant.primary,
            label: 'Tap',
            onPressed: () => pressed = true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Tap'));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButton(
            variant: HeroButtonVariant.primary,
            label: 'Disabled',
            enabled: false,
            onPressed: () => pressed = true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disabled'));
      await tester.pumpAndSettle();
      expect(pressed, isFalse);
    });

    testWidgets('renders with leading icon', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButton(
            variant: HeroButtonVariant.primary,
            label: 'Search',
            leadingIcon: Icons.search,
            onPressed: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('renders all variants without error', (tester) async {
      for (final variant in HeroButtonVariant.values) {
        await tester.pumpWidget(
          wrapWithTheme(
            HeroButton(variant: variant, label: variant.name, onPressed: () {}),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text(variant.name), findsOneWidget);
      }
    });

    testWidgets('renders all sizes without error', (tester) async {
      for (final size in HeroButtonSize.values) {
        await tester.pumpWidget(
          wrapWithTheme(
            HeroButton(
              variant: HeroButtonVariant.primary,
              size: size,
              label: size.name,
              onPressed: () {},
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text(size.name), findsOneWidget);
      }
    });
  });

  group('HeroIconButton', () {
    testWidgets('renders with icon', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(HeroIconButton(icon: Icons.favorite, onPressed: () {})),
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroIconButton(icon: Icons.favorite, onPressed: () => pressed = true),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroIconButton(
            icon: Icons.favorite,
            enabled: false,
            onPressed: () => pressed = true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pumpAndSettle();
      expect(pressed, isFalse);
    });

    testWidgets('renders all sizes without error', (tester) async {
      for (final size in HeroButtonSize.values) {
        await tester.pumpWidget(
          wrapWithTheme(
            HeroIconButton(size: size, icon: Icons.favorite, onPressed: () {}),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byIcon(Icons.favorite), findsOneWidget);
      }
    });

    testWidgets('inherits variant and size from HeroButtonGroup', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButtonGroup(
            variant: HeroButtonVariant.danger,
            size: HeroButtonSize.lg,
            children: [HeroIconButton(icon: Icons.favorite, onPressed: () {})],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('inherits disabled state from HeroButtonGroup', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButtonGroup(
            enabled: false,
            children: [
              HeroIconButton(
                icon: Icons.favorite,
                onPressed: () => pressed = true,
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pumpAndSettle();
      expect(pressed, isFalse);
    });
  });

  group('HeroButtonGroup', () {
    testWidgets('renders children', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButtonGroup(
            variant: HeroButtonVariant.tertiary,
            children: [
              HeroButton(label: 'First', onPressed: () {}),
              HeroButton(label: 'Second', onPressed: () {}),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('propagates variant to children', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButtonGroup(
            variant: HeroButtonVariant.danger,
            children: [HeroButton(label: 'Danger Child', onPressed: () {})],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Danger Child'), findsOneWidget);
    });

    testWidgets('propagates disabled to children', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButtonGroup(
            variant: HeroButtonVariant.tertiary,
            enabled: false,
            children: [
              HeroButton(label: 'Disabled', onPressed: () => pressed = true),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disabled'));
      await tester.pumpAndSettle();
      expect(pressed, isFalse);
    });

    testWidgets('renders with separators', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButtonGroup(
            variant: HeroButtonVariant.tertiary,
            children: [
              HeroButton(label: 'A', onPressed: () {}),
              const HeroButtonGroupSeparator(),
              HeroButton(label: 'B', onPressed: () {}),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
    });

    testWidgets('child can override group variant', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButtonGroup(
            variant: HeroButtonVariant.tertiary,
            children: [
              HeroButton(
                variant: HeroButtonVariant.primary,
                label: 'Override',
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Override'), findsOneWidget);
    });

    testWidgets('outline variant renders group stroke', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroButtonGroup(
            variant: HeroButtonVariant.outline,
            children: [
              HeroButton(label: 'Left', onPressed: () {}),
              HeroButton(label: 'Right', onPressed: () {}),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      final groupFlexBoxFinder = find.byType(FlexBox);
      expect(groupFlexBoxFinder, findsOneWidget);

      final groupStrokeFinder = find.descendant(
        of: groupFlexBoxFinder,
        matching: find.byWidgetPredicate((widget) {
          if (widget is! DecoratedBox) {
            return false;
          }
          final decoration = widget.decoration;
          if (decoration is! BoxDecoration) {
            return false;
          }
          final border = decoration.border;
          if (border == null) {
            return false;
          }
          return border.top.width > 0 && border.top.style != BorderStyle.none;
        }),
      );

      expect(groupStrokeFinder, findsOneWidget);
    });
  });

  group('HeroTextField', () {
    testWidgets('generated widget forwards curated input parameters', (
      tester,
    ) async {
      final controller = TextEditingController();
      addTearDown(controller.dispose);
      String? changedValue;

      await tester.pumpWidget(
        wrapWithTheme(
          HeroTextField(
            controller: controller,
            label: 'Email',
            hintText: 'name@example.com',
            fullWidth: true,
            onChanged: (value) => changedValue = value,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('name@example.com'), findsOneWidget);

      await tester.enterText(find.byType(EditableText), 'user@example.com');
      await tester.pump();

      expect(controller.text, 'user@example.com');
      expect(changedValue, 'user@example.com');
    });
  });

  group('generated component migration', () {
    testWidgets('HeroCard renders its child', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(const HeroCard(child: Text('Card content'))),
      );

      expect(find.text('Card content'), findsOneWidget);
    });

    testWidgets('HeroLinkButton renders icons and forwards presses', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroLinkButton(
            label: 'Learn more',
            leadingIcon: Icons.arrow_back,
            trailingIcon: Icons.arrow_forward,
            onPressed: () => pressed = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      await tester.tap(find.text('Learn more'));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('HeroSlider renders a configured value range', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(HeroSlider(value: 30, max: 100, onChanged: (_) {})),
      );
      await tester.pumpAndSettle();

      expect(find.byType(HeroSlider), findsOneWidget);
    });

    testWidgets('HeroSelect renders its placeholder', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroSelect<String>(
            trigger: const HeroSelectTrigger(placeholder: 'Select a state'),
            items: const [HeroSelectItem(value: 'ny', label: 'New York')],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Select a state'), findsOneWidget);
    });
  });

  group('remaining primitive migration', () {
    testWidgets('HeroToggleButton renders and forwards selection', (
      tester,
    ) async {
      bool? selected;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroToggleButton(
            selected: false,
            label: 'Bold',
            onChanged: (value) => selected = value,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Bold'));
      await tester.pumpAndSettle();
      expect(selected, isTrue);
    });

    testWidgets('HeroSidebarItem forwards presses', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        wrapWithTheme(
          HeroSidebarItem(
            selected: false,
            label: 'Settings',
            onChanged: (_) => pressed = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('HeroRadioGroup renders its child', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          HeroRadioGroup<String>(
            groupValue: 'one',
            onChanged: (_) {},
            child: const Text('Radio group content'),
          ),
        ),
      );

      expect(find.text('Radio group content'), findsOneWidget);
    });

    testWidgets('HeroDivider renders plain and labeled forms', (tester) async {
      await tester.pumpWidget(
        wrapWithTheme(
          const Column(
            children: [
              HeroDivider(),
              HeroLabeledDivider(label: 'Continue'),
            ],
          ),
        ),
      );

      expect(find.byType(HeroDivider), findsNWidgets(3));
      expect(find.text('Continue'), findsOneWidget);
    });
  });
}
