// import 'package:best_flutter_ui_templates/advanced_video_analysis/components/home_page.dart';
// import 'package:best_flutter_ui_templates/advanced_video_analysis/components/video.dart';
// import 'package:best_flutter_ui_templates/advanced_video_analysis/widget/select_video_page.dart';
// import 'package:imageview360/imageview360.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _hoverIndex = -1;

//   List<Map<String, dynamic>> _buttonList = [
//     {"image": "assets/images/camera_icon.png", "label": "Open Camera"},
//     {"image": "assets/images/gallery_icon.png", "label": "Upload Video"},
//     {"image": "assets/images/statics_icon.png", "label": "Stats"},
//     {"image": "assets/images/help_icon.png", "label": "Help"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
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
//       body: Stack(
//         children: [
//           Positioned(
//             top: 100,
//             left: 40,
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => VideoRecorder()));
//               },
//               onHover: (value) {
//                 setState(() {
//                   _hoverIndex = value ? 0 : -1;
//                 });
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: _hoverIndex == 0 ? Colors.grey : Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Image.asset(
//                         _buttonList[0]["image"],
//                         width: 100,
//                         height: 100,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     _buttonList[0]["label"],
//                     style: TextStyle(fontSize: 18),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: 100,
//             right: 40,
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => SelectVideoPage()));
//               },
//               onHover: (value) {
//                 setState(() {
//                   _hoverIndex = value ? 1 : -1;
//                 });
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: _hoverIndex == 1 ? Colors.grey : Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Image.asset(
//                         _buttonList[1]["image"],
//                         width: 100,
//                         height: 100,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     _buttonList[1]["label"],
//                     style: TextStyle(fontSize: 18),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: 380,
//             left: 40,
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => HomePage()));
//               },
//               onHover: (value) {
//                 setState(() {
//                   _hoverIndex = value ? 2 : -1;
//                 });
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: _hoverIndex == 2 ? Colors.grey : Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Image.asset(
//                         _buttonList[2]["image"],
//                         width: 100,
//                         height: 100,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     _buttonList[2]["label"],
//                     style: TextStyle(fontSize: 18),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: 380,
//             right: 40,
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => MyPage()));
//               },
//               onHover: (value) {
//                 setState(() {
//                   _hoverIndex = value ? 3 : -1;
//                 });
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: _hoverIndex == 3 ? Colors.grey : Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Image.asset(
//                         _buttonList[3]["image"],
//                         width: 100,
//                         height: 100,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     _buttonList[3]["label"],
//                     style: TextStyle(fontSize: 18),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DemoPage extends StatefulWidget {
//   // DemoPage({Key key, this.title}) : super(key: key);

//   // final String title;

//   @override
//   _DemoPageState createState() => _DemoPageState();
// }

// class _DemoPageState extends State<DemoPage> {
//   List<AssetImage> imageList = <AssetImage>[];
//   bool autoRotate = true;
//   int rotationCount = 2;
//   int swipeSensitivity = 2;
//   bool allowSwipeToRotate = true;
//   RotationDirection rotationDirection = RotationDirection.anticlockwise;
//   Duration frameChangeDuration = Duration(milliseconds: 50);
//   bool imagePrecached = false;

//   @override
//   void initState() {
//     //* To load images from assets after first frame build up.
//     WidgetsBinding.instance
//         .addPostFrameCallback((_) => updateImageList(context));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 248, 236, 228),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(
//         // alignment: Alignment.center,
//         children: <Widget>[
//           (imagePrecached == true)
//               ? ImageView360(
//                   key: UniqueKey(),
//                   imageList: imageList,
//                   autoRotate: false,
//                   rotationCount: 2,
//                   rotationDirection: RotationDirection.anticlockwise,
//                   frameChangeDuration: Duration(milliseconds: 170),
//                   swipeSensitivity: swipeSensitivity,
//                   allowSwipeToRotate: allowSwipeToRotate,
//                 )
//               : Text("Pre-Caching images..."),
//         ],
//       ),
//     );
//   }

//   void updateImageList(BuildContext context) async {
//     for (int i = 1; i <= 36; i++) {
//       imageList.add(AssetImage('assets/images/$i.jpg'));
//       //* To precache images so that when required they are loaded faster.
//       await precacheImage(AssetImage('assets/images/$i.jpg'), context);
//     }
//     setState(() {
//       imagePrecached = true;
//     });
//   }
// }
