import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class MovementSpeedTracker extends StatefulWidget {
  const MovementSpeedTracker({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MovementSpeedTrackerState createState() => _MovementSpeedTrackerState();
}

class _MovementSpeedTrackerState extends State<MovementSpeedTracker> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;
  DateTime? _lastUpdate;
  double _speed = 0.0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      // Get the current acceleration values
      final double x = event.x;
      final double y = event.y;
      final double z = event.z;

      // Calculate the movement speed
      final now = DateTime.now();
      if (_lastUpdate != null) {
        final timeDiff = now.difference(_lastUpdate!);
        final speed =
            (x + y + z - _x - _y - _z) / timeDiff.inMilliseconds * 10000;
        setState(() {
          _speed = speed.abs();
        });
      }
      _lastUpdate = now;

      // Store the current values as previous for the next iteration
      _x = x;
      _y = y;
      _z = z;
    });
  }

  @override
  void dispose() {
    super.dispose();
    accelerometerEvents.drain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bowling1.gif',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: 400,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 49, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                // borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                'Speed: ${_speed.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
