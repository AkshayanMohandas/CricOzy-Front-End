import 'package:best_flutter_ui_templates/advanced_video_analysis/components/home_page.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/widget/video_player_widget.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final ResultData resultData;

  ResultsPage({required this.resultData});

  Widget build(BuildContext context) {
    List<Map<String, dynamic>> shots = [
      {
        'name': 'Drive',
        'image': AssetImage('assets/images/drive.jpg'),
        'value': resultData.result['Player_1'][0]
      },
      {
        'name': 'Leg-glance \nFlick',
        'image': AssetImage('assets/images/flick.jpg'),
        'value': resultData.result['Player_1'][1]
      },
      {
        'name': 'Pullshot',
        'image': AssetImage('assets/images/pull.jpg'),
        'value': resultData.result['Player_1'][2]
      },
      {
        'name': 'Sweep',
        'image': AssetImage('assets/images/sweep.jpg'),
        'value': resultData.result['Player_1'][3]
      },
    ];

    double maxShotValue =
        shots.map((shot) => shot['value']).reduce((a, b) => a > b ? a : b);
    String mostPlayedShot =
        shots.firstWhere((shot) => shot['value'] == maxShotValue)['name'];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 236, 228),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyPage()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Results',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
              SizedBox(height: 10),
              DataTable(
                dataRowHeight: 100.0,
                columns: [
                  DataColumn(label: Text('Shot')),
                  DataColumn(label: Text('Value')),
                ],
                rows: shots
                    .map(
                      (shot) => DataRow(cells: [
                        DataCell(
                          Row(
                            children: [
                              Image(
                                image: shot['image'],
                                height: 117,
                                width: 117,
                              ),
                              SizedBox(width: 10),
                              Text(shot['name']),
                            ],
                          ),
                        ),
                        DataCell(Text(shot['value'].toString())),
                      ]),
                    )
                    .toList(),
              ),

              // SizedBox(height: 20),
              Text(
                'The technique demonstrated in the video you have uploaded primarily pertains to the $mostPlayedShot technique.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How to improve your skills for $mostPlayedShot:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  if (maxShotValue >= 0 && maxShotValue < 20)
                    Text(
                      "To improve your $mostPlayedShot technique, it's important to focus on your body position and grip. Try to practice different $mostPlayedShot shots while paying attention to these aspects. Additionally, it can be beneficial to analyze the techniques of professional players and incorporate their strategies into your own practice routine. With dedication and consistent effort, you can develop a strong and effective $mostPlayedShot technique that will help you succeed on the field.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  if (maxShotValue >= 20 && maxShotValue < 40)
                    Text(
                      "It seems like you have a basic understanding of $mostPlayedShot technique, but there is still room for improvement. You should focus on developing better accuracy and timing, which can only come through consistent practice and feedback from experienced players or coaches. Consider taking a few lessons or attending some coaching clinics to learn new drills and techniques that can help you refine your skills. With dedication and hard work, you can become a more confident and effective batter.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  if (maxShotValue >= 40 && maxShotValue < 60)
                    Text(
                      "Your $mostPlayedShot technique is showing potential, but you need to work on refining it further by focusing on consistency and timing. Additionally, you should develop a game plan around this shot to make it more effective in game situations. Try to work with experienced coaches or players to analyze your technique and strategy, and practice consistently to improve your skills. With dedication and effort, you can elevate your $mostPlayedShot performance and become a valuable asset to your team.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  if (maxShotValue >= 60 && maxShotValue < 80)
                    Text(
                      "Great job on having a good understanding of $mostPlayedShot technique and consistency in executing it. To make this shot more effective, you need to focus on improving your accuracy and power. Keep practicing this shot and try to incorporate it into your overall game strategy. Work on your timing and footwork to ensure you can execute this shot in different game situations. Analyze the techniques of professional players to improve your skills and stay ahead of the game.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  if (maxShotValue >= 80 && maxShotValue <= 100)
                    Text(
                      "With your excellent $mostPlayedShot technique, you are able to execute the shot with precision and power, giving you an advantage over your opponents. To maintain your consistency, keep practicing and challenging yourself to improve your skills. Additionally, try to incorporate this shot into your game plan to keep your opponents guessing and gain an edge in the game. By analyzing the strategies of professional players and seeking feedback from experienced coaches, you can continue to enhance your technique and dominate the field.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
