// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'package:best_flutter_ui_templates/advanced_video_analysis/components/analyse_video.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/components/home_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResultData {
  final Map<String, dynamic> result;

  ResultData({required this.result});
}

class VideoPlayerWidget extends StatefulWidget {
  final File file;

  VideoPlayerWidget({Key? key, required this.file}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAnalyseButtonPressed() async {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }

    // Show a progress dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: Color.fromARGB(255, 255, 255, 255),
              size: 150.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Analyzing video, please wait...',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );

    // Create a multipart request with the video file
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:8082/upload-video'), //IOS
      // Uri.parse('http://10.0.2.2:8082/upload-video'), //android
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

      // Hide the progress dialog
      Navigator.pop(context);

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

  void _onCancelButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyPage()),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _onAnalyseButtonPressed,
                child: Text('Analyse'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 19, 33, 55),
                  onPrimary: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _onCancelButtonPressed,
                child: Text('Cancel'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 19, 33, 55),
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
