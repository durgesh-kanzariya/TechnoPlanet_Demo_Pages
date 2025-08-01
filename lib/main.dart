import 'package:flutter/material.dart';
import 'package:flutter_widget_tutorials/login_page.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: Login()),
      ),
    );
  }
}
