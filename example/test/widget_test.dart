import 'package:flutter_test/flutter_test.dart';

import 'package:example/widgetbook_app.dart';

void main() {
  testWidgets('renders hero ui widgetbook', (WidgetTester tester) async {
    await tester.pumpWidget(const HeroUiWidgetbookApp());
    expect(find.byType(HeroUiWidgetbookApp), findsOneWidget);
  });
}
