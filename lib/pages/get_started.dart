import 'package:flutter/material.dart';
import 'package:gifts_app/pages/login_page.dart';
import 'package:gifts_app/pages/signup_page.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:gifts_app/widgets/main_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -170,
            child: SizedBox(
              width: 550,
              height: 1000,
              child: Image.asset('assets/get_started.png',),
            ),
          ),
          Positioned(
            bottom: 180,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: MainButton(title: 'تسجيل الدخول', action: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));}),
            ),
          ),
          Positioned(
            bottom: 100,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: MainButton(title: 'إنشاء حساب', bgColor: pageColor, titleColor: mainColor, action: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));}),
            ),
          ),
          Positioned(
            top: 80,
            right: 30,
            child: Text('مرحباً بكم\nفي متجر الهدايا لدينا', style: TextStyle(color: mainColor, fontSize: 35, fontWeight: FontWeight.bold,), textDirection: TextDirection.rtl, textAlign: TextAlign.right,),
          )
        ],
      ),
    );
  }
}
