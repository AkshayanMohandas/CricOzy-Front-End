import 'package:best_flutter_ui_templates/advanced_video_analysis/components/help.dart';
import 'package:best_flutter_ui_templates/model/aboutus_page.dart';
import 'package:best_flutter_ui_templates/model/feedback_screen.dart';
import 'package:best_flutter_ui_templates/model/invite_friend_screen.dart';
import 'package:best_flutter_ui_templates/model/rating_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UI Tests', () {
    testWidgets('RateUsPage should display stars and submit rating',
        (WidgetTester tester) async {
      // Build the RateUsPage widget
      await tester.pumpWidget(MaterialApp(home: RateUsPage()));

      // Expect to see the logo
      expect(find.byType(Image), findsOneWidget);

      // Expect to see the rating prompt
      expect(find.text('How would you rate our app?'), findsOneWidget);

      // Tap on the third star
      await tester.tap(find.byIcon(Icons.star_border).at(2));
      await tester.pump();

      // Tap on the submit button
      await tester.tap(find.text('Submit'));
      await tester.pump();
    });

    testWidgets('InviteFriend widget displays correctly',
        (WidgetTester tester) async {
      // Build InviteFriend widget and trigger a frame
      await tester.pumpWidget(
        MaterialApp(
          home: InviteFriend(),
        ),
      );

      // Verify that the widget has loaded correctly
      expect(find.text('Invite Your Friends'), findsOneWidget);
      expect(
          find.text(
              'Are you one of those who makes everything\n at the last moment?'),
          findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byIcon(Icons.share), findsOneWidget);
    });

    testWidgets('Help screen should have a title and a chat button',
        (WidgetTester tester) async {
      // Build the widget tree
      await tester.pumpWidget(MaterialApp(home: HelpScreen()));

      // Check that the title is displayed
      expect(find.text('How can we help you?'), findsOneWidget);

      // Check that the chat button is displayed
      expect(find.widgetWithText(InkWell, 'Chat with Us'), findsOneWidget);
    });

    testWidgets('FeedbackScreen renders correctly',
        (WidgetTester tester) async {
      // Build the widget tree.
      await tester.pumpWidget(FeedbackScreen());

      // Expect to find the "Your Feedback" text.
      expect(find.text('Your FeedBack'), findsOneWidget);

      // Expect to find the "Give your best time for this moment." text.
      expect(find.text('Give your best time for this moment.'), findsOneWidget);

      // Expect to find the "Send" button.
      expect(find.text('Send'), findsOneWidget);

      // Expect to find the text field.
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('About Us Page UI Test', (WidgetTester tester) async {
      // Build the AboutUsPage widget.
      await tester.pumpWidget(MaterialApp(home: AboutUsPage()));

      // Check if the page title is correct.
      expect(find.text('About Us'), findsOneWidget);

      // Check if the team member images are displayed.
      expect(find.byType(Image), findsNWidgets(6));

      // Check if the team member names are displayed.
      expect(find.text('M.Akshayan'), findsOneWidget);
      expect(find.text('R.Gajeendran'), findsOneWidget);
      expect(find.text('M.Z.M.Ramzy'), findsOneWidget);
      expect(find.text('T.L.Banuji'), findsOneWidget);
      expect(find.text('F.Daniel'), findsOneWidget);

      // Check if the team member roles are displayed.
      expect(find.text('Front-End Developer'), findsNWidgets(3));
      expect(find.text('Back-End Developer'), findsNWidgets(3));
    });
  });
}
