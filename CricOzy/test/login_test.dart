// import 'package:best_flutter_ui_templates/model/login_page.dart';
// import 'package:best_flutter_ui_templates/model/navigation_home_screen.dart';
// import 'package:best_flutter_ui_templates/model/signup_page.dart';
// import 'package:best_flutter_ui_templates/services/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:mockito/mockito.dart';

// class MockAuthService extends Mock implements AuthService {}

// void main() {
//   group('LoginPage widget test', () {
//     late Widget testWidget;
//     late AuthService mockAuthService;

//     setUp(() {
//       // Create a mock AuthService object for testing purposes
//       mockAuthService = MockAuthService();

//       testWidget = MaterialApp(
//         home: LoginPage(
//           auth: mockAuthService,
//         ),
//       );
//     });

//     testWidgets('Email and password are not empty',
//         (WidgetTester tester) async {
//       // Build the LoginPage widget
//       await tester.pumpWidget(testWidget);

//       // Enter valid email and password values
//       await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
//       await tester.enterText(find.byKey(Key('passwordField')), 'password');

//       // Tap the Login button
//       await tester.tap(find.text('Login'));

//       // Wait for the async login function to complete
//       await tester.pumpAndSettle();

//       // Expect that the logIn function of AuthService was called once with the correct arguments
//       verify(mockAuthService.logIn('test@example.com', 'password')).called(1);
//     });

//     testWidgets('Email and password are empty', (WidgetTester tester) async {
//       // Build the LoginPage widget
//       await tester.pumpWidget(testWidget);

//       // Leave the email and password fields empty
//       await tester.enterText(find.byKey(Key('emailField')), '');
//       await tester.enterText(find.byKey(Key('passwordField')), '');

//       // Tap the Login button
//       await tester.tap(find.text('Login'));

//       // Wait for the async login function to complete
//       await tester.pumpAndSettle();

//       // Expect that the logIn function of AuthService was not called
//       verifyNever(mockAuthService.logIn(any, any));
//     });

//     testWidgets('Successful login navigates to Home screen',
//         (WidgetTester tester) async {
//       // Build the LoginPage widget
//       await tester.pumpWidget(testWidget);

//       // Enter valid email and password values
//       await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
//       await tester.enterText(find.byKey(Key('passwordField')), 'password');

//       // Mock the AuthService's logIn function to return a non-null value
//       when(mockAuthService.logIn(any, any)).thenAnswer((_) async => true);

//       // Tap the Login button
//       await tester.tap(find.text('Login'));

//       // Wait for the async login function to complete and navigate to the Home screen
//       await tester.pumpAndSettle();

//       // Expect that the NavigationHomeScreen widget is displayed
//       expect(find.byType(NavigationHomeScreen), findsOneWidget);
//     });

//     testWidgets('Failed login shows error message',
//         (WidgetTester tester) async {
//       // Build the LoginPage widget
//       await tester.pumpWidget(testWidget);

//       // Enter invalid email and password values
//       await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
//       await tester.enterText(find.byKey(Key('passwordField')), 'wrongpassword');

//       // Mock the AuthService's logIn function to return a null value
//       when(mockAuthService.logIn(any, any)).thenAnswer((_) async => null);

//       // Tap the Login button
//       await tester.tap(find.text('Login'));

//       // Wait for the
// // Wait for the async login function to complete and show the error message
//       await tester.pumpAndSettle();

// // Expect that the error message is displayed
//       expect(find.text('Login failed'), findsOneWidget);

// // Expect that the NavigationHomeScreen widget is not displayed
//       expect(find.byType(NavigationHomeScreen), findsNothing);
//     });
//     testWidgets('Navigate to Sign up page', (WidgetTester tester) async {
//       // Build the LoginPage widget
//       await tester.pumpWidget(testWidget);

//       // Tap the Sign up button
//       await tester.tap(find.text('Sign up'));

//       // Wait for the async navigation function to complete and navigate to the Sign up page
//       await tester.pumpAndSettle();

//       // Expect that the SignupPage widget is displayed
//       expect(find.byType(SignupPage), findsOneWidget);
//     });
//   });
// }
