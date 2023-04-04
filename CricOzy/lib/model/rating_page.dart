// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RateUsPage extends StatefulWidget {
  @override
  _RateUsPageState createState() => _RateUsPageState();
}

class _RateUsPageState extends State<RateUsPage> {
  int _rating = 0;
  String _comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 236, 228),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/logo_blue.png'),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              'How would you rate our app?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStar(1),
                _buildStar(2),
                _buildStar(3),
                _buildStar(4),
                _buildStar(5),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Leave a comment',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _comment = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Send rating and comment to server
                print('Rating: $_rating, Comment: $_comment');
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 19, 33, 55),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStar(int rating) {
    return IconButton(
      onPressed: () {
        setState(() {
          _rating = rating;
        });
      },
      icon: Icon(
        rating <= _rating ? Icons.star : Icons.star_border,
        size: 40.0,
        color: Colors.amber,
      ),
    );
  }
}
