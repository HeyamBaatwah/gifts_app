import 'package:gifts_app/logic/login_methods.dart';
import 'package:flutter/material.dart';
import 'package:gifts_app/pages/Index_page.dart';
import 'package:gifts_app/pages/get_started.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogged;
  late Map<String, dynamic> userInfo;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getUserInfo();
  }

  getUserInfo() async {
    userInfo = await LogInMethods.getUserInfo();
  }

  checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool('isLoggedIn');
    setState(() {
      isLogged = result ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo'
      ),
      home: isLogged == null ? Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                color: mainColor,
                strokeWidth: 8,
              ),
            )
        ),
      ) : isLogged! ? IndexPage(userInfo: userInfo,) : GetStarted(),
    );
  }
}
