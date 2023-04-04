// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'video_player_widget.dart';

// class SelectVideoPage extends StatefulWidget {
//   @override
//   _SelectVideoPageState createState() => _SelectVideoPageState();
// }

// class _SelectVideoPageState extends State<SelectVideoPage> {
//   File _videoFile = File('');
//   bool _isVideoUploaded = false;

//   Future<void> _pickVideo() async {
//     final result = await FilePicker.platform.pickFiles(type: FileType.video);

//     if (result != null) {
//       setState(() {
//         _videoFile = File(result.files.single.path ?? '');
//         _isVideoUploaded = true;
//       });
//     }
//   }

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
//             size: 25,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: _isVideoUploaded == true
//                     ? VideoPlayerWidget(file: _videoFile)
//                     : MaterialButton(
//                         onPressed: _pickVideo,
//                         color: Color.fromARGB(255, 19, 33, 55),
//                         elevation: 5.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Text(
//                             'Pick a video',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                             ),
//                           ),
//                         ),
//                       ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
