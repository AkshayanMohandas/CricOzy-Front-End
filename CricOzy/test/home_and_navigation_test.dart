import 'package:best_flutter_ui_templates/advanced_video_analysis/components/help.dart';
import 'package:best_flutter_ui_templates/model/aboutus_page.dart';
import 'package:best_flutter_ui_templates/model/feedback_screen.dart';
import 'package:best_flutter_ui_templates/model/home_screen.dart';
import 'package:best_flutter_ui_templates/model/invite_friend_screen.dart';
import 'package:best_flutter_ui_templates/model/navigation_home_screen.dart';
import 'package:best_flutter_ui_templates/model/rating_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NavigationHomeScreen should build', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NavigationHomeScreen()));
    expect(find.byType(NavigationHomeScreen), findsOneWidget);
  });

  testWidgets('NavigationHomeScreen should show home screen by default',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NavigationHomeScreen()));
    expect(find.byType(MyHomePage), findsOneWidget);
  });

  testWidgets(
      'NavigationHomeScreen should change screens when drawer item is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NavigationHomeScreen()));

    await tester.tap(find.byIcon(Icons.help));
    await tester.pumpAndSettle();
    expect(find.byType(HelpScreen), findsOneWidget);

    await tester.tap(find.byIcon(Icons.feedback));
    await tester.pumpAndSettle();
    expect(find.byType(FeedbackScreen), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person_add));
    await tester.pumpAndSettle();
    expect(find.byType(InviteFriend), findsOneWidget);

    await tester.tap(find.byIcon(Icons.share));
    await tester.pumpAndSettle();
    expect(find.byType(RateUsPage), findsOneWidget);

    await tester.tap(find.byIcon(Icons.info));
    await tester.pumpAndSettle();
    expect(find.byType(AboutUsPage), findsOneWidget);
  });

  testWidgets('MyHomePage should build', (WidgetTester tester) async {
    // Build MyHomePage and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

    // Verify that MyHomePage is built correctly.
    expect(
        find.text(
            'Unleash Your Cricket Potential with CricOzy: \nYour Ultimate Companion for Everything Cricket'),
        findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });
}
