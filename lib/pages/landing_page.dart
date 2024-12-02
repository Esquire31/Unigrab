import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'canteen/canteen_login_page.dart'; // Import the CanteenLoginPage

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Unigrab',
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Why Wait? Just Grab!',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all<Size>(Size(200, 50)),
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed) ||
                              states.contains(WidgetState.hovered)) {
                            return Colors.white;
                          }
                          return Colors.black;
                        },
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed) ||
                              states.contains(WidgetState.hovered)) {
                            return Colors.black;
                          }
                          return Colors.white;
                        },
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all<Size>(Size(200, 50)),
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed) ||
                              states.contains(WidgetState.hovered)) {
                            return Colors.white;
                          }
                          return Colors.black;
                        },
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed) ||
                              states.contains(WidgetState.hovered)) {
                            return Colors.black;
                          }
                          return Colors.white;
                        },
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text('Register'),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all<Size>(Size(200, 50)),
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed) ||
                              states.contains(WidgetState.hovered)) {
                            return Colors.white;
                          }
                          return Colors.black;
                        },
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed) ||
                              states.contains(WidgetState.hovered)) {
                            return Colors.black;
                          }
                          return Colors.white;
                        },
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CanteenLoginPage()),
                      );
                    },
                    child: Text('Canteen Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}