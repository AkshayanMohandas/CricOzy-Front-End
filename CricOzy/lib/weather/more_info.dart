import 'dart:ui';

import 'package:best_flutter_ui_templates/weather/constanst.dart';
import 'package:flutter/material.dart';

Widget moreInfo({
  required String wind,
  required String humidity,
  required String feelsLike,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        width: w,
        height: h / 12,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 1.9)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Wind", style: kMoreInfoFont),
                Text("Humidity", style: kMoreInfoFont),
                Text("FeelsLike", style: kMoreInfoFont),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(wind, style: kMoreInfoFont),
                Text(humidity, style: kMoreInfoFont),
                Text(feelsLike, style: kMoreInfoFont),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
