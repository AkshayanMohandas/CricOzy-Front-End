// ////////////////////SPEEDOMETER//////////////////////////

// import 'package:best_flutter_ui_templates/speedOmeter/speed.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:sensors/sensors.dart';
// import 'package:mockito/mockito.dart';

// class MockAccelerometerEvents extends Mock
//     implements Stream<AccelerometerEvent> {}

// void main() {
//   group('MovementSpeedTracker', () {
//     late Stream<AccelerometerEvent> accelerometerEvents;
//     late MockAccelerometerEvents mockAccelerometerEvents;

//     setUp(() {
//       mockAccelerometerEvents = MockAccelerometerEvents();
//       accelerometerEvents = mockAccelerometerEvents.asBroadcastStream();
//       when(accelerometerEvents.listen(any))
//           .thenAnswer((_) => Stream<AccelerometerEvent>.empty());
//       // The above mock sets up an empty stream to start with, to prevent any side effects from the real stream.
//     });

//     testWidgets('should display correct speed value',
//         (WidgetTester tester) async {
//       // Arrange
//       final widget = MovementSpeedTracker();

//       // Act
//       await tester.pumpWidget(MaterialApp(home: widget));
//       await Future.delayed(Duration(
//           milliseconds: 500)); // Wait for a moment to let the widget update.

//       // Assert
//       expect(find.text('Speed: 0.00'), findsOneWidget);

//       // Simulate an event that changes the acceleration values.
//       whenListen(accelerometerEvents,
//           Stream.fromIterable([AccelerometerEvent(1.0, 2.0, 3.0)]));
//       await Future.delayed(Duration(
//           milliseconds: 500)); // Wait for a moment to let the widget update.
//       expect(find.text('Speed: 0.00'),
//           findsOneWidget); // Speed should still be 0, as there is no previous update to compare to.

//       whenListen(accelerometerEvents,
//           Stream.fromIterable([AccelerometerEvent(2.0, 3.0, 4.0)]));
//       await Future.delayed(Duration(milliseconds: 500));
//       expect(find.text('Speed: 15.00'),
//           findsOneWidget); // Speed should now be 15, based on the previous values.

//       // Simulate another event, this time with negative values.
//       whenListen(accelerometerEvents,
//           Stream.fromIterable([AccelerometerEvent(-1.0, -2.0, -3.0)]));
//       await Future.delayed(Duration(milliseconds: 500));
//       expect(find.text('Speed: 6.00'),
//           findsOneWidget); // Speed should now be 6, based on the previous values.

//       // Dispose the widget and drain the stream to prevent any memory leaks or side effects.
//       await tester.pumpWidget(Container());
//       await tester.pumpAndSettle(); // Wait for any animations to finish.
//       widget.dispose();
//       await expectLater(accelerometerEvents.drain(), completes);
//     });
//   });
// }
