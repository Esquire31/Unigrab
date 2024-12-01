import 'package:flutter/material.dart';
import '../util/unigrabTheme.dart'; // Import the theme file

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor, // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the left
          children: <Widget>[
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('profile.png'), // Replace with actual profile picture asset
              ),
            ),
            SizedBox(height: 16.0),
            // User Name
            Center(
              child: Text(
                'John Doe', // Replace with actual user name
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the text color to black
                ),
              ),
            ),
            SizedBox(height: 8.0),
            // User Email
            Center(
              child: Text(
                'john.doe@example.com', // Replace with actual user email
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Edit Profile Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle edit profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryButtonColor, // Set the button color to match the theme
                ),
                child: Text('Edit Profile'),
              ),
            ),
            SizedBox(height: 16.0),
            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryButtonColor, // Set the button color to match the theme
                ),
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}