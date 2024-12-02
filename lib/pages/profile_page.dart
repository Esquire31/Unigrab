import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../util/unigrabTheme.dart'; // Import the theme file
import 'login_page.dart'; // Import the LoginPage for redirection after logout

class ProfilePage extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor, // Set the background color
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: primaryColor, // Set the AppBar color to match the theme
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the left
          children: <Widget>[
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/profile.png'), // Replace with actual profile picture asset
              ),
            ),
            SizedBox(height: 16.0),
            // User Name
            Center(
              child: Text(
                user?.displayName ?? 'No Name', // Display user's name
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
                user?.email ?? 'No Email', // Display user's email
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
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
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