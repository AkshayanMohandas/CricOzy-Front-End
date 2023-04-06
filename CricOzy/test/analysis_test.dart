////////////////////Analyse Video///////////////////////////

import 'package:CriCozy/advanced_video_analysis/components/analyse_video.dart';
import 'package:CriCozy/advanced_video_analysis/widget/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResultsPage', () {
    ResultData resultData = ResultData(result: {
      'Player_1': [20, 30, 40, 10]
    });

    testWidgets('should display the correct shots and values in a DataTable',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ResultsPage(resultData: resultData),
      ));

      expect(find.text('Drive'), findsOneWidget);
      expect(find.text('20'), findsOneWidget);
      expect(find.text('Leg-glance \nFlick'), findsOneWidget);
      expect(find.text('30'), findsOneWidget);
      expect(find.text('Pullshot'), findsOneWidget);
      expect(find.text('40'), findsOneWidget);
      expect(find.text('Sweep'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('should display the correct most played shot in a Text widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ResultsPage(resultData: resultData),
      ));

      expect(
          find.text(
              'The technique demonstrated in the video you have uploaded primarily pertains to the Pullshot technique.'),
          findsOneWidget);
    });

    testWidgets(
        'should display the correct text for improving skills in a Text widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ResultsPage(resultData: resultData),
      ));

      expect(find.text('How to improve your skills for Pullshot:'),
          findsOneWidget);
      expect(find.text('I'), findsOneWidget);
    });
  });
}
