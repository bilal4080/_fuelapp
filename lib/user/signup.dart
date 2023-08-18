import 'package:flutter/material.dart';
import 'package:app/user/userdashboard.dart';
import 'signin.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _formKey = GlobalKey<FormState>();

  String _password = '';
  String _confirmPassword = '';
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_password != _confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Passwords do not match'),
          ),
        );
      } else {
        // Password validation
        if (_password.length < 8 ||
            !_password.contains(RegExp(r'[A-Z]')) ||
            !_password.contains(RegExp(r'[0-9]'))) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Password must be at least 8 characters long and contain at least one capital letter and one number'),
            ),
          );
        } else {
          // Navigate to a new page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDashboardScreen(),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.3,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0, left: 22),
                        child: Text(
                          'Create Your\nAccount',
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          color: Colors.white,
                        ),
                        height: constraints.maxHeight * 0.7,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.check,
                                      color: Colors.grey,
                                    ),
                                    labelText: 'Full Name',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your full name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {},
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.check,
                                      color: Colors.grey,
                                    ),
                                    labelText: 'Phone or Gmail',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone or Gmail';
                                    }
                                    if (!value.contains('@') ||
                                        !value.contains('.')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {},
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: _togglePasswordVisibility,
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  obscureText: !_showPassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _password = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showConfirmPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed:
                                          _toggleConfirmPasswordVisibility,
                                    ),
                                    labelText: 'Confirm Password',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  obscureText: !_showConfirmPassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your password';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _confirmPassword = value!;
                                  },
                                ),
                                SizedBox(
                                  height: constraints.maxHeight * 0.02,
                                ),
                                SizedBox(
                                  height: constraints.maxHeight * 0.1,
                                ),
                                ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    minimumSize: Size(300, 55),
                                  ),
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: constraints.maxHeight * 0.1,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Have an account?",
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
                                                builder: (context) =>
                                                    loginScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Sign In",
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
            ),
          );
        },
      ),
    );
  }
}
