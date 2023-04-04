import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  final String apiUrl = "http://localhost:5000/pose";

  Future<Map<String, dynamic>> getPose(String imageBase64) async {
    final response =
        await http.post(apiUrl as Uri, body: {'image': imageBase64});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load pose');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pose Detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // Get image from somewhere, such as a camera or image picker
                // Here, we use a sample image
                String imageBase64 =
                    "iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAAAXNSR0IArs4c6QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAJpJREFUSA3tV8EJgCAM3s7/1nYI2gV4oxv6U2mV+TYZ6MEj7V8l9J9P7+VkFCj6Y23pm2QWjFEvDM3aMC3dcY0J+ha0wGpKjDpqfTJRpRuk8OjKbh+PU6Dg7imMgoMuS8j7VzMzvmtU4J6bnO4F8LdnDPSXyy5gAAAABJRU5ErkJggg==";
                Map<String, dynamic> poseData = await getPose(imageBase64);
                print(poseData);
              },
              child: Text('Detect Pose'),
            ),
          ],
        ),
      ),
    );
  }
}
