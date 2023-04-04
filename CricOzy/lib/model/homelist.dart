import 'package:best_flutter_ui_templates/Fitness/screens/home_screen.dart';
import 'package:best_flutter_ui_templates/advanced_video_analysis/introduction_animation_screen.dart';
import 'package:best_flutter_ui_templates/speedOmeter/first_page.dart';
import 'package:flutter/widgets.dart';
import '../toss_spinner/toss_spinner.dart';
import '../weather/weather_page.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.label = '',
    this.description = '',
  });

  String label;
  String description;
  Widget? navigateScreen;
  String imagePath;

  static List homeList = [
    HomeList(
      label: 'ProPlayer Analyzer',
      // description:
      // 'Compare your skills with the pros using advanced video analysis.',
      imagePath: 'assets/images/ProgressTrack.gif',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      label: 'CricOzy Fit',
      // description:
      // 'Elevate Your Cricket Performance with Comprehensive Fitness Tracking and Workout Plans',
      imagePath: 'assets/images/gym.gif',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      label: 'Coin Flipper',
      // description: 'Flip a virtual coin to make decisions or settle disputes.',
      imagePath: 'assets/images/Toss.gif',
      navigateScreen: CoinToss(),
    ),
    HomeList(
      label: 'Bowl Master',
      // description:
      //     "Improve Your Bowling Speed and Accuracy with CricOzy's Speed-O-Meter Feature",
      imagePath: 'assets/images/bowling.gif',
      navigateScreen: FirstPage(),
    ),
    HomeList(
      label: 'Weather Watch',
      // description:
      //     'Stay Ahead of the Game with Real-Time Weather Updates for Your Location and Beyond',
      imagePath: 'assets/images/weather_.gif',
      navigateScreen: WeatherPage(),
    ),
  ];
}
