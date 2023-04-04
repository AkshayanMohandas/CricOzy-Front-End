// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:best_flutter_ui_templates/advanced_video_analysis/components/home_page.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/widget/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:best_flutter_ui_templates/advanced_video_analysis/components/analyse_video.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class VideoRecorder extends StatefulWidget {
  late final File file;

  @override
  _VideoRecorderState createState() => _VideoRecorderState();
}

class _VideoRecorderState extends State<VideoRecorder> {
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _controller;

  void _onAnalyseButtonPressed() async {
    if (_controller!.value.isPlaying) {
      _controller?.pause();
    }

// Create a multipart request with the video file
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:8082/upload-video'),
      // Uri.parse('http://10.0.2.2:8082/upload-video'),
    );
    final fileStream = new http.ByteStream(widget.file.openRead());
    final fileLength = await widget.file.length();

    final multipartFile = new http.MultipartFile(
      'video',
      fileStream,
      fileLength,
      filename: path.basename(widget.file.path),
    );

// Add the multipart file to the request
    request.files.add(multipartFile);

// Send the request and wait for the response
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final result = json.decode(responseData);
      print(result);
      // final Map<String, List<double>> data = result;

      print('Video uploaded successfully!');
      final resultData = ResultData(result: result);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(resultData: resultData),
        ),
      );
    } else {
      print('Error uploading video');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 236, 228),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Color.fromARGB(255, 248, 236, 228),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                final XFile? file = await _picker.pickVideo(
                    source: ImageSource.camera,
                    maxDuration: const Duration(seconds: 120));
                if (file != null) {
                  _playVideo(file);
                  print("Video Path ${file.path}");
                }
                setState(() {});
              },
              icon: Icon(
                Icons.video_call_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              color: Color.fromARGB(255, 19, 33, 55),
            ),
            SizedBox(height: 20),
            _previewVideo(),
          ],
        ),
      ),
    );
  }

  Widget _previewVideo() {
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: AspectRatioVideo(_controller),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _onAnalyseButtonPressed,
              child: Text('Analysis'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 19, 33, 55),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
              child: Text('Cancel'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 19, 33, 55),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;

      controller = VideoPlayerController.file(File(file.path));
      _controller = controller;

      await controller.setVolume(0.0);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    } else {
      print("Loading Video error");
    }
  }

  Future<void> _disposeVideoController() async {
    if (_controller != null) {
      await _controller!.pause();
      await _controller!.dispose();
    }
    _controller = null;
  }
}

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}

// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';
// import 'package:image_picker/image_picker.dart';

// class VideoRecorder extends StatefulWidget {
//   @override
//   _VideoRecorderState createState() => _VideoRecorderState();
// }

// class _VideoRecorderState extends State<VideoRecorder> {
//   final ImagePicker _picker = ImagePicker();
//   VideoPlayerController? _controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 248, 236, 228),
//       appBar: AppBar(
//         elevation: 0,
//         // ignore: deprecated_member_use
//         brightness: Brightness.light,
//         backgroundColor: Color.fromARGB(255, 248, 236, 228),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed: () async {
//                 final XFile? file = await _picker.pickVideo(
//                     source: ImageSource.camera,
//                     maxDuration: const Duration(seconds: 120));
//                 if (file != null) {
//                   _playVideo(file);
//                   print("Video Path ${file.path}");
//                 }
//                 setState(() {});
//               },
//               icon: Icon(
//                 Icons.video_call_rounded,
//                 color: Color.fromARGB(255, 0, 0, 0),
//               ),
//               color: Color.fromARGB(255, 19, 33, 55),
//             ),
//             SizedBox(height: 20),
//             _previewVideo(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _previewVideo() {
//     if (_controller == null) {
//       return const Text(
//         'You have not yet picked a video',
//         textAlign: TextAlign.center,
//       );
//     }
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: AspectRatioVideo(_controller),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Perform analysis action here
//               },
//               child: Text('Analysis'),
//               style: ElevatedButton.styleFrom(
//                 primary: Color.fromARGB(255, 19, 33, 55),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Perform cancel action here
//               },
//               child: Text('Cancel'),
//               style: ElevatedButton.styleFrom(
//                 primary: Color.fromARGB(255, 19, 33, 55),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Future<void> _playVideo(XFile? file) async {
//     if (file != null && mounted) {
//       await _disposeVideoController();
//       late VideoPlayerController controller;

//       controller = VideoPlayerController.file(File(file.path));
//       _controller = controller;

//       await controller.setVolume(0.0);
//       await controller.initialize();
//       await controller.setLooping(true);
//       await controller.play();
//       setState(() {});
//     } else {
//       print("Loading Video error");
//     }
//   }

//   Future<void> _disposeVideoController() async {
//     if (_controller != null) {
//       await _controller!.pause();
//       await _controller!.dispose();
//     }
//     _controller = null;
//   }
// }

// class AspectRatioVideo extends StatefulWidget {
//   AspectRatioVideo(this.controller);

//   final VideoPlayerController? controller;

//   @override
//   AspectRatioVideoState createState() => AspectRatioVideoState();
// }

// class AspectRatioVideoState extends State<AspectRatioVideo> {
//   VideoPlayerController? get controller => widget.controller;
//   bool initialized = false;

//   void _onVideoControllerUpdate() {
//     if (!mounted) {
//       return;
//     }
//     if (initialized != controller!.value.isInitialized) {
//       initialized = controller!.value.isInitialized;
//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller!.addListener(_onVideoControllerUpdate);
//   }

//   @override
//   void dispose() {
//     controller!.removeListener(_onVideoControllerUpdate);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (initialized) {
//       return Center(
//         child: AspectRatio(
//           aspectRatio: controller!.value.aspectRatio,
//           child: VideoPlayer(controller!),
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }
// }
