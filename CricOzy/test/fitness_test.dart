import 'package:best_flutter_ui_templates/Fitness/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Round 1 exercises are displayed correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            itemCount: round1.length,
            itemBuilder: (BuildContext context, int index) {
              final exercise = round1[index];
              return ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      exercise['leading'][0],
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Text(exercise['leading'][1]),
                  ],
                ),
                title: Text(exercise['title']),
                subtitle: Text(exercise['subtitle']),
                trailing: exercise['trailing'],
              );
            },
          ),
        ),
      ),
    );

    // Verify that the exercises are displayed correctly
    expect(find.text('Single-leg deadlifts'), findsOneWidget);
    expect(find.text('Dumbbell rolls'), findsOneWidget);
    expect(find.text('Side plank'), findsOneWidget);
    expect(find.text('Glute bridge'), findsOneWidget);
    expect(find.text('T-Bar Row'), findsOneWidget);
    expect(find.text('Front Raise'), findsOneWidget);

    // Verify that the leading widget of the first exercise is displayed correctly
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('10 x'), findsOneWidget);
  });
}
