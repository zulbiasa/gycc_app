import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login action
      print('Username: $_username');
      print('Password: $_password');
      // Here you can add your login logic, e.g., API call
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE1F0FA), // Light Blue
                Color(0xFFF7E0E3), // Light Pink
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              // Image at the bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'lib/assets/images/illustration.png', // Replace with your image path
                  fit: BoxFit.cover,
                  height: mediaQuery.size.height * 0.4, // Adjust height as needed
                ),
              ),
              // Card and logo
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                  children: [
                    // App logo
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0), // Adjust top padding to move the logo higher
                      child: Image.asset(
                        'lib/assets/icon/icon.png', // Replace with your logo path
                        height: 100, // Adjust height as needed
                      ),
                    ),
                    // Card for login form
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      child: Card(
                        elevation: 8,
                        color: Color(0xFFE1F0FA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    labelStyle: TextStyle(fontSize: 18),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your username';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _username = value;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(fontSize: 18),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _password = value;
                                  },
                                ),
                                SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: _login,
                                  child: Text('Login', style: TextStyle(fontSize: 20)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.alphaBlend(Color(0xFFF7E0E3), Color(0xFFE1F0FA)), // Use the primary color from the theme
                                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 100),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20), // Rounded corners
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Copyright notice at the bottom
              const Positioned(
                bottom: 20, // Adjust the position as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'All Right Reserved by © Group 12 2024',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54, // Change color as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}