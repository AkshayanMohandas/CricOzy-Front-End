// ////////////////////SINGUP PAGE//////////////////////////

// import 'package:best_flutter_ui_templates/model/login_page.dart';
// import 'package:best_flutter_ui_templates/model/signup_page.dart';
// import 'package:best_flutter_ui_templates/services/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// // Mock AuthService class
// class MockAuthService extends Mock implements AuthService {}

// void main() {
//   // Instantiate MockAuthService
//   MockAuthService mockAuthService = MockAuthService();

//   group('SignupPage Widget', () {
//     // Test case for successful signup
//     testWidgets('Successful Signup', (WidgetTester tester) async {
//       // Stub the AuthService signIn method to return a non-null value
//       when(mockAuthService.signIn(any, any)).thenAnswer((_) async => {});

//       // Build the widget
//       await tester.pumpWidget(MaterialApp(
//         home: SignupPage(auth: mockAuthService),
//       ));

//       // Enter some text into the email and password fields
//       await tester.enterText(
//           find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
//       await tester.enterText(
//           find.widgetWithText(TextFormField, 'Password'), 'password');
//       await tester.enterText(
//           find.widgetWithText(TextFormField, 'Confirm Password'), 'password');

//       // Tap the signup button
//       await tester.tap(find.widgetWithText(MaterialButton, 'Sign up'));
//       await tester.pump();

//       // Verify that the AuthService signIn method was called with the correct parameters
//       verify(mockAuthService.signIn('test@example.com', 'password')).called(1);

//       // Verify that we navigated to the LoginPage
//       expect(find.byType(LoginPage), findsOneWidget);
//     });

//     // Test case for unsuccessful signup
//     testWidgets('Unsuccessful Signup', (WidgetTester tester) async {
//       // Stub the AuthService signIn method to return a null value
//       when(mockAuthService.signIn(any, any)).thenAnswer((_) async => null);

//       // Build the widget
//       await tester.pumpWidget(MaterialApp(
//         home: SignupPage(auth: mockAuthService),
//       ));

//       // Enter some text into the email and password fields
//       await tester.enterText(
//           find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
//       await tester.enterText(
//           find.widgetWithText(TextFormField, 'Password'), 'password');
//       await tester.enterText(
//           find.widgetWithText(TextFormField, 'Confirm Password'), 'password');

//       // Tap the signup button
//       await tester.tap(find.widgetWithText(MaterialButton, 'Sign up'));
//       await tester.pump();

//       // Verify that the AuthService signIn method was called with the correct parameters
//       verify(mockAuthService.signIn('test@example.com', 'password')).called(1);

//       // Verify that the error message is displayed
//       expect(find.text('Entered email is incorrect or already registered!'),
//           findsOneWidget);

//       // Verify that we did not navigate to the LoginPage
//       expect(find.byType(LoginPage), findsNothing);
//     });
//   });
// }
