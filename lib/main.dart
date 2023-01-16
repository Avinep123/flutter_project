import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/loginpage.dart';
import 'widgets/theme.dart';

void main() {
  runApp(const MountainApp());
}

class MountainApp extends StatefulWidget {
  const MountainApp({super.key});

  @override
  State<MountainApp> createState() => _MountainAppState();
}

class _MountainAppState extends State<MountainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Mytheme.lightTheme(context),
      home: LoginPage(),
    );
  }
}
