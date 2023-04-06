import 'package:CriCozy/advanced_video_analysis/components/analysis_page.dart';
import 'package:CriCozy/advanced_video_analysis/components/input_page.dart';
import 'package:CriCozy/advanced_video_analysis/components/process_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Widget Tests', () {
    testWidgets('InputPage should render with correct input text',
        (tester) async {
      // Create a mock animation controller
      final animationController = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 500),
      );

      // Pump the widget tree
      await tester.pumpWidget(MaterialApp(
          home: RelaxView(animationController: animationController)));

      // Find the text widget with "Input" as its text
      final inputTextFinder = find.text("Input");

      // Expect to find the text widget
      expect(inputTextFinder, findsOneWidget);

      // Find the text widget containing the input description
      final inputDescriptionFinder = find.text(
          "CricOzy requires the user to upload a video of themselves playing cricket");

      // Expect to find the description text widget
      expect(inputDescriptionFinder, findsOneWidget);
    });

    testWidgets('ProcessPage displays correct text and image', (tester) async {
      final animationController = AnimationController(
          vsync: const TestVSync(), duration: Duration(seconds: 1));

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: CareView(animationController: animationController))));

      // Verify that the "Process" text is displayed
      expect(find.text('Process'), findsOneWidget);

      // Verify that the image is displayed
      expect(find.byType(Image), findsOneWidget);

      // Verify that the text below the image is displayed
      expect(
          find.text(
              'As the input is processed, CricOzy will compare it to the datasets'),
          findsOneWidget);
    });

    testWidgets('AnalysisPage should render with correct text and image',
        (tester) async {
      // Create a mock animation controller
      final animationController = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 500),
      );

      // Pump the widget tree
      await tester.pumpWidget(MaterialApp(
          home: MoodDiaryVew(animationController: animationController)));

      // Find the "Analysis" text widget
      final analysisTextFinder = find.text('Analysis');

      // Expect to find the "Analysis" text widget
      expect(analysisTextFinder, findsOneWidget);

      // Find the mood analysis text widget
      final moodAnalysisTextFinder =
          find.text('The user will get an analysis of their video.');

      // Expect to find the mood analysis text widget
      expect(moodAnalysisTextFinder, findsOneWidget);
    });
  });
}
