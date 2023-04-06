////////////////////TOSS SPINNER//////////////////////////

import 'package:CriCozy/toss_spinner/toss_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoinToss widget', () {
    testWidgets('renders the initial state correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(CoinToss());
      expect(find.text('Heads'), findsOneWidget);
      expect(find.text('Tails'), findsNothing);
    });

    testWidgets('flips the coin when tapped', (WidgetTester tester) async {
      await tester.pumpWidget(CoinToss());
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();
      expect(find.text('Heads'), findsNothing);
      expect(find.text('Tails'), findsOneWidget);
    });

    testWidgets('navigates back when back button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(CoinToss());
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byType(CoinToss), findsNothing);
    });
  });
}
