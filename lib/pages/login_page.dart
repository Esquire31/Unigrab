import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
                  image: AssetImage('background.png'),
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
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Login into your account',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 32.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: true,
                          onChanged: (bool? value) {
                            // Handle remember me logic here
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password logic here
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color>(
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
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
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
                  onPressed: () {
                  // Add login logic here
                  },
                  child: Text('Login'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                    ),
                  ),
                    TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
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
                    child: Text('Register'),
                    ),
                  ],
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
