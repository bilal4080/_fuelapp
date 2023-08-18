import 'package:app/user/signup.dart';
import 'package:app/user/userdashboard.dart';
import 'package:flutter/material.dart';

import '../Admin/adminDashboard.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<loginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length > 8) {
      return 'Password should have a maximum of 8 characters';
    }
    return null;
  }

  void _clearErrorText() {
    setState(() {
      _emailErrorText = null;
      _passwordErrorText = null;
    });
  }

  void _loginUser() {
    setState(() {
      _clearErrorText();
      _emailController.text = _emailController.text.trim();
      _passwordController.text = _passwordController.text.trim();
    });

    final emailError = _validateEmail(_emailController.text);
    final passwordError = _validatePassword(_passwordController.text);

    if (emailError == null && passwordError == null) {
      // Check if the email and password match the admin credentials
      if (_emailController.text == 'admin@example.com' &&
          _passwordController.text == '12345678') {
        // Redirect to the admin panel
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FuelAppDashboard(),
          ),
        );
      } else {
        // Redirect to the user dashboard
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDashboardScreen(),
          ),
        );
      }
    } else {
      setState(() {
        _emailErrorText = emailError;
        _passwordErrorText = passwordError;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 22),
                  child: Text(
                    'Hello\nSign in!',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.check,
                              color: Colors.grey,
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            errorText: _emailErrorText,
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            errorText: _passwordErrorText,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xff281537),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: Size(300, 55),
                            ),
                            onPressed: _loginUser,
                            child: const Text(
                              'SIGN IN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegScreen()),
                                  );
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
