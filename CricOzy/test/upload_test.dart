// ////////////////////Upload Video//////////////////////////

// import 'dart:io';
// import 'package:best_flutter_ui_templates/advanced_video_analysis/widget/video_player_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/mockito.dart';
// import 'package:path/path.dart' as path;
// import 'package:video_player/video_player.dart';

// import 'package:best_flutter_ui_templates/advanced_video_analysis/components/analyse_video.dart';
// import 'package:best_flutter_ui_templates/advanced_video_analysis/components/home_page.dart';

// class MockFile extends Mock implements File {}

// class MockVideoPlayerController extends Mock implements VideoPlayerController {}

// class MockMultipartFile extends Mock implements http.MultipartFile {}

// class MockMultipartRequest extends Mock implements http.MultipartRequest {}

// class MockStreamedResponse extends Mock implements http.StreamedResponse {}

// void main() {
//   group('VideoPlayerWidget', () {
//     late VideoPlayerController mockController;
//     late File mockFile;
//     late MockMultipartFile mockMultipartFile;
//     late MockMultipartRequest mockRequest;
//     late MockStreamedResponse mockResponse;

//     setUp(() {
//       mockController = MockVideoPlayerController();
//       mockFile = MockFile();
//       mockMultipartFile = MockMultipartFile();
//       mockRequest = MockMultipartRequest();
//       mockResponse = MockStreamedResponse();
//     });

//     tearDown(() {
//       mockController.dispose();
//     });

//     testWidgets('renders video player', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: VideoPlayerWidget(file: mockFile),
//         ),
//       );

//       expect(find.byType(VideoPlayer), findsOneWidget);
//     });

//     testWidgets('calls play on controller', (WidgetTester tester) async {
//       when(mockController.value)
//           .thenReturn(const VideoValue(duration: Duration.zero));

//       await tester.pumpWidget(
//         MaterialApp(
//           home: VideoPlayerWidget(file: mockFile),
//         ),
//       );

//       await mockController.initialize();

//       verify(mockController.play()).called(1);
//     });

//     testWidgets('analyzes video and navigates to results page',
//         (WidgetTester tester) async {
//       when(mockController.value)
//           .thenReturn(const VideoValue(duration: Duration.zero));
//       when(mockController.initialize()).thenAnswer((_) async {});
//       when(mockController.pause()).thenAnswer((_) async {});

//       when(mockFile.length()).thenAnswer((_) async => 1234);
//       when(mockFile.path).thenReturn('/path/to/file');
//       when(mockFile.openRead()).thenReturn(Stream.empty());

//       when(mockMultipartFile.filename).thenReturn('file.mp4');
//       when(mockMultipartFile.length).thenReturn(1234);
//       when(mockMultipartFile.field).thenReturn('video');

//       when(mockRequest.send()).thenAnswer((_) async => mockResponse);
//       when(mockResponse.statusCode).thenReturn(200);
//       when(mockResponse.stream)
//           .thenAnswer((_) async => Stream.value(utf8.encode('{}')));

//       final navigatorObserver = MockNavigatorObserver();
//       final widget = VideoPlayerWidget(file: mockFile);
//       await tester.pumpWidget(
//         MaterialApp(
//           home: widget,
//           navigatorObservers: [navigatorObserver],
//         ),
//       );

//       await mockController.initialize();
//       await widget._onAnalyseButtonPressed();

//       verify(mockController.pause()).called(1);

//       verify(mockRequest.files.add(mockMultipartFile)).called(1);

//       verify(navigatorObserver.didPush(any!, any)).called(1);
//     });
//   });
// }
