import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'canteen_home_page.dart'; // Import the CanteenHomePage

class CanteenLoginPage extends StatefulWidget {
  @override
  _CanteenLoginPageState createState() => _CanteenLoginPageState();
}

class _CanteenLoginPageState extends State<CanteenLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CanteenHomePage()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Login failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Canteen Login',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Login to manage your canteen',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 32.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.white), // Set text color to white
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white70), // Set label text color to white
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(Icons.email, color: Colors.white70),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.white), // Set text color to white
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white70), // Set label text color to white
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.white70),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed) ||
                                  states.contains(MaterialState.hovered)) {
                                return Colors.white;
                              }
                              return Colors.black;
                            },
                          ),
                          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed) ||
                                  states.contains(MaterialState.hovered)) {
                                return Colors.black;
                              }
                              return Colors.white;
                            },
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: _login,
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}