import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 236, 228),
      // appBar: AppBar(
      //   title: Text('About Us'),
      // ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 96.0),
            Text(
              'Building the Future of Cricket with',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Team Matrix',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 36.0),
            Text(
              'Meet Our Talented Team',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 36.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTeamMember(
                    'assets/images/akshayan.jpg',
                    'M.Akshayan',
                    'Front-End Developer',
                  ),
                  _buildTeamMember(
                    'assets/images/gajeendran.jpg',
                    'R.Gajeendran',
                    'Back-End Developer',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTeamMember(
                    'assets/images/ramzy.jpg',
                    'M.Z.M.Ramzy',
                    'Back-End Developer',
                  ),
                  _buildTeamMember(
                    'assets/images/banuji.jpg',
                    'T.L.Banuji',
                    'Front-End Developer',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            _buildTeamMember(
              'assets/images/daniel.jpg',
              'F.Daniel',
              'Front-End Developer',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(String imagePath, String name, String role) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 110.0,
            height: 110.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            role,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
