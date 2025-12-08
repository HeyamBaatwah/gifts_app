import 'package:flutter/material.dart';
import 'package:gifts_app/logic/login_methods.dart';
import 'package:gifts_app/pages/Index_page.dart';
import 'package:gifts_app/pages/signup_page.dart';
import 'package:gifts_app/widgets/circular_button.dart';
import 'package:gifts_app/widgets/main_button.dart';
import 'package:gifts_app/widgets/text_input_field.dart';
import '../widgets/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  late String message = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.only(top: 30, left: 20),
            child: CircularButton(icon: Icons.arrow_back_ios_outlined, action: () {
              Navigator.pop(context);
            }),
          ),
          Container(
          height: 700,
          width: double.infinity,
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(50),),
            boxShadow: [BoxShadow(color: shadowColor, blurRadius: 4, spreadRadius: 0, offset: Offset(0, -4))]
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text('مرحباً بعودتك', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                Text('هل انت جاهز لمتابعة التسوق؟', style: TextStyle(color: mainGrey, fontSize: 20), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                SizedBox(height: 50,),
                TextInputField(title: 'اسم المستخدم', hint: 'ادخل اسم المستخدم', controller: _controller1, validator: LogInMethods.validateUsername),
                SizedBox(height: 10,),
                TextInputField(title: 'كلمة المرور', hint: 'ادخل كلمة المرور', controller: _controller2, validator: LogInMethods.validatePassword),
                SizedBox(height: 30,),
                Text(message, style: TextStyle(color: Colors.red,),),
                SizedBox(height: 20,),
                MainButton(title: 'تسجيل الدخول', action: () async {
                  if(_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    bool result = await LogInMethods.checkValue(_controller1.text, _controller2.text);
                    Map<String, dynamic> userInfo = await LogInMethods.getUserInfo();
                    if(result) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IndexPage(userInfo: userInfo,)));
                    } else {
                      setState(() {
                        message = 'Invalid username or password';
                      });
                    }

                  }
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
        ],
      )
    );
  }
}
