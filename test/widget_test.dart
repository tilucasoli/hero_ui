import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hero_ui/hero_ui.dart';

Widget wrapWithTheme(Widget child) {
  return MaterialApp(
    home: HeroTheme.fromSeeds(
      accent: Colors.blue,
      danger: Colors.red,
      child: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('HeroButton', () {
    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Click me',
          onPressed: () {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Click me'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(wrapWithTheme(
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Tap',
          onPressed: () => pressed = true,
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Tap'));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var pressed = false;
      await tester.pumpWidget(wrapWithTheme(
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Disabled',
          isDisabled: true,
          onPressed: () => pressed = true,
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disabled'));
      await tester.pumpAndSettle();
      expect(pressed, isFalse);
    });

    testWidgets('renders with leading icon', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButton(
          variant: HeroButtonVariant.primary,
          label: 'Search',
          iconLeft: Icons.search,
          onPressed: () {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('renders all variants without error', (tester) async {
      for (final variant in HeroButtonVariant.values) {
        await tester.pumpWidget(wrapWithTheme(
          HeroButton(
            variant: variant,
            label: variant.name,
            onPressed: () {},
          ),
        ));
        await tester.pumpAndSettle();
        expect(find.text(variant.name), findsOneWidget);
      }
    });

    testWidgets('renders all sizes without error', (tester) async {
      for (final size in HeroButtonSize.values) {
        await tester.pumpWidget(wrapWithTheme(
          HeroButton(
            variant: HeroButtonVariant.primary,
            size: size,
            label: size.name,
            onPressed: () {},
          ),
        ));
        await tester.pumpAndSettle();
        expect(find.text(size.name), findsOneWidget);
      }
    });
  });

  group('HeroButtonGroup', () {
    testWidgets('renders children', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(label: 'First', onPressed: () {}),
            HeroButton(label: 'Second', onPressed: () {}),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('propagates variant to children', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.danger,
          children: [
            HeroButton(label: 'Danger Child', onPressed: () {}),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Danger Child'), findsOneWidget);
    });

    testWidgets('propagates disabled to children', (tester) async {
      var pressed = false;
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          isDisabled: true,
          children: [
            HeroButton(label: 'Disabled', onPressed: () => pressed = true),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Disabled'));
      await tester.pumpAndSettle();
      expect(pressed, isFalse);
    });

    testWidgets('renders with separators', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
        HeroButtonGroup(
          variant: HeroButtonVariant.tertiary,
          children: [
            HeroButton(label: 'A', onPressed: () {}),
            const HeroButtonGroupSeparator(),
            HeroButton(label: 'B', onPressed: () {}),
          ],
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
    });

    testWidgets('child can override group variant', (tester) async {
      await tester.pumpWidget(wrapWithTheme(
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
      ));
      await tester.pumpAndSettle();
      expect(find.text('Override'), findsOneWidget);
    });
  });
}
