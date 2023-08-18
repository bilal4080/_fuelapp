// import 'package:app/user/splashscree.dart';
// import 'package:app/user/splashscree.dart';
import 'package:flutter/material.dart';
// import 'Admin/adminDashboard.dart';
import 'user/userdashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: FuelAppDashboard(),
      home: UserDashboardScreen(),
      // ignore: prefer_const_constructors
      // home: WelcomeScreen(),
      // home: FuelAppDashboard(),//admin
      debugShowCheckedModeBanner: false,
    );
  }
}
