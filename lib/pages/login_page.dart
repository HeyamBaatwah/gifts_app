import 'package:flutter/material.dart';
import 'package:gifts_app/pages/signup_page.dart';
import 'package:gifts_app/widgets/main_button.dart';
import 'package:gifts_app/widgets/text_input_field.dart';
import '../widgets/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 700,
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
                Text('مرحباً بعودتك', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                Text('هل انت جاهز لمتابعة التسوق؟', style: TextStyle(color: mainGrey, fontSize: 20), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                SizedBox(height: 50,),
                TextInputField(title: 'اسم المستخدم', hint: 'ادخل اسم المستخدم', validator: () {

                }),
                SizedBox(height: 10,),
                TextInputField(title: 'كلمة المرور', hint: 'ادخل كلمة المرور', validator: () {
                }),
                SizedBox(height: 50,),
                MainButton(title: 'تسجيل الدخول', action: () {

                }),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                      },
                      child: Text('إنشاء حساب', style: TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: mainColor), textAlign: TextAlign.right, textDirection: TextDirection.rtl,)
                    ),
                    Text('ليس لديك حساب؟ ', style: TextStyle(color: Colors.black, fontSize: 16), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
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
