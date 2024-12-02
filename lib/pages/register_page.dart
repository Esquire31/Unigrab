import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/bottom_nav.dart'; // Import the BottomNav page

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Registration failed')),
        );
      }
    }
  }

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
                  image: AssetImage('background.png'), // Same background as login_page
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
                  'Create Account',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Sign up to get started',
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
                        controller: _nameController,
                        style: TextStyle(color: Colors.white), // Set text color to white
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: Colors.white70), // Set label text color to white
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(Icons.person, color: Colors.white70),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
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
                              return Theme.of(context).primaryColor;
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
                        onPressed: _register,
                        child: Text('Sign Up'),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered)) {
                                    return Colors.white70;
                                  }
                                  return Theme.of(context).primaryColor;
                                },
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}