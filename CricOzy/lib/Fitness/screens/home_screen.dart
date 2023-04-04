import 'dart:ui';

import 'package:best_flutter_ui_templates/Fitness/screens/workout_screen.dart';
import 'package:best_flutter_ui_templates/Fitness/widgets/round_info_container.dart';
import 'package:flutter/material.dart';

class FitnessAppHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/home_image.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Color.fromARGB(255, 19, 33, 55).withOpacity(.3),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'CricOzy - BODY KILLER\nWORKOUT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                  child: Text(
                    "Introducing our CricOzy Fitness feature, designed specifically for cricket enthusiasts who want to improve their fitness and skills to become better players. Our feature is the perfect solution for individuals who want to train to play cricket to their fullest potential. You can access a variety of cricket-specific fitness workouts, including strength training, agility drills, and cardio exercises. Each workout is tailored to the specific demands of cricket, helping you improve your endurance, power, speed, and agility. You can track your progress and set goals to stay motivated and keep pushing yourself.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundInfoContainer(
                      title: '26',
                      subtitle: 'Minutes',
                    ),
                    _divider(),
                    RoundInfoContainer(
                      title: '3',
                      subtitle: 'Rounds',
                    ),
                    _divider(),
                    RoundInfoContainer(
                      title: 'EASY',
                      subtitle: 'Level',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WorkoutScreen(),
              )),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 19, 33, 55),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start workout',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 20.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1.2,
      height: 35,
      color: Colors.white.withOpacity(.6),
    );
  }
}
