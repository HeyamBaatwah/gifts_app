import 'package:flutter/material.dart';
import 'package:gifts_app/pages/Index_page.dart';
import 'package:gifts_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'هدايا',
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}