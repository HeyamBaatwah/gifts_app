import 'package:flutter/material.dart';
import 'package:gifts_app/pages/login_page.dart';
import 'package:gifts_app/widgets/colors.dart';

import '../widgets/main_button.dart';
import '../widgets/text_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pageColor,
        body: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 800,
            width: double.infinity,
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(50),),
                boxShadow: [BoxShadow(color: shadowColor, blurRadius: 4, spreadRadius: 0, offset: Offset(0, -4))]
            ),
            child: Form(
              child: Column(
                children: [
                  Text('إنشاء حسابك', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                  Text('نحن هنا لمساعدتك لاختيار افضل الهدايا لمناسباتك', style: TextStyle(color: mainGrey, fontSize: 20), textAlign: TextAlign.center, textDirection: TextDirection.rtl, ),
                  SizedBox(height: 50,),
                  TextInputField(title: 'اسم المستخدم', hint: 'ادخل اسم المستخدم', validator: () {

                  }),
                  SizedBox(height: 10,),
                  TextInputField(title: 'كلمة المرور', hint: 'ادخل كلمة المرور', validator: () {
                  }),
                  SizedBox(height: 10,),
                  TextInputField(title: 'البريد الإلكتروني', hint: 'ادخل بريدك الإلكتروني', validator: () {
                  }),
                  SizedBox(height: 10,),
                  TextInputField(title: 'الجوال', hint: 'ادخل رقم الجوال', validator: () {
                  }),
                  SizedBox(height: 50,),
                  MainButton(title: 'إنشاء حساب', action: () {

                  }),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Text('تسجيل الدخول', style: TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: mainColor), textAlign: TextAlign.right, textDirection: TextDirection.rtl,)
                      ),
                      Text('لديك حساب؟ ', style: TextStyle(color: Colors.black, fontSize: 16), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
