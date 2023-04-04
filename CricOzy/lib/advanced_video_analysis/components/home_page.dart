// import 'package:best_flutter_ui_templates/advanced_video_analysis/components/help.dart';
// import 'package:best_flutter_ui_templates/advanced_video_analysis/components/video.dart';
// import 'package:best_flutter_ui_templates/advanced_video_analysis/widget/select_video_page.dart';
// import 'package:best_flutter_ui_templates/model/navigation_home_screen.dart';
// import 'package:flutter/material.dart';

// class MyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 248, 236, 228),
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.push(context,
//               MaterialPageRoute(builder: (context) => NavigationHomeScreen())),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 248, 236, 228),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//               _buildButton(context, "Record Video", Icons.videocam, () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => VideoRecorder()),
//                 );
//               }),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//               _buildButton(context, "Upload Video", Icons.upload_file, () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SelectVideoPage()),
//                 );
//               }),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//               _buildButton(context, "Help", Icons.help, () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HelpScreen()),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildButton(
//     BuildContext context,
//     String label,
//     IconData icon,
//     VoidCallback onPressed,
//   ) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.8,
//         height: MediaQuery.of(context).size.height * 0.1,
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 19, 33, 55),
//           borderRadius: BorderRadius.circular(25),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               blurRadius: 5,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Icon(
//                 icon,
//                 color: Colors.white,
//                 size: 32,
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     label,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                   Icon(
//                     Icons.chevron_right,
//                     color: Colors.white,
//                     size: 32,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/components/help.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/components/video.dart';
import 'package:best_flutter_ui_templates/model/navigation_home_screen.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/widget/video_player_widget.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 236, 228),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavigationHomeScreen())),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 236, 228),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              _buildButton(context, "Upload from Gallery", Icons.photo_library,
                  () async {
                final result =
                    await FilePicker.platform.pickFiles(type: FileType.video);
                if (result != null) {
                  final _videoFile = File(result.files.single.path ?? '');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              backgroundColor:
                                  Color.fromARGB(255, 248, 236, 228),
                              appBar: AppBar(
                                elevation: 0,
                                brightness: Brightness.light,
                                backgroundColor:
                                    Color.fromARGB(255, 248, 236, 228),
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
                              body: Container(
                                padding: EdgeInsets.only(
                                    top: 50.0, left: 10.0, right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Center(
                                          child: VideoPlayerWidget(
                                              file: _videoFile)),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  );
                }
              }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              _buildButton(context, "Record Video", Icons.videocam, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoRecorder()),
                );
              }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              _buildButton(context, "Help", Icons.help, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpScreen()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 19, 33, 55),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                icon,
                color: Colors.white,
                size: 32,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
