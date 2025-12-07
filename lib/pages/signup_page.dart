import 'package:flutter/material.dart';
import 'package:gifts_app/logic/login_methods.dart';
import 'package:gifts_app/pages/Index_page.dart';
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
            bottom: 20, // يمنع اختفاء الزر أسفل الكيبورد
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 4,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إنشاء حسابك',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    'نحن هنا لمساعدتك لاختيار افضل الهدايا لمناسباتك',
                    style: TextStyle(color: mainGrey, fontSize: 20),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 50),
                  TextInputField(
                    title: 'اسم المستخدم',
                    hint: 'ادخل اسم المستخدم',
                    controller: _controller1,
                    validator: LogInMethods.validateUsername,
                  ),
                  const SizedBox(height: 10),
                  TextInputField(
                    title: 'كلمة المرور',
                    hint: 'ادخل كلمة المرور',
                    controller: _controller2,
                    validator: LogInMethods.validatePassword,
                  ),
                  const SizedBox(height: 10),
                  TextInputField(
                    title: 'البريد الإلكتروني',
                    hint: 'ادخل بريدك الإلكتروني',
                    controller: _controller3,
                    validator: LogInMethods.validateEmail,
                  ),
                  const SizedBox(height: 10),
                  TextInputField(
                    title: 'الجوال',
                    hint: 'ادخل رقم الجوال',
                    controller: _controller4,
                    validator: LogInMethods.validatePhone,
                  ),
                  const SizedBox(height: 50),
                  MainButton(
                    title: 'إنشاء حساب',
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        LogInMethods.saveInfo(
                          _controller1.text,
                          _controller2.text,
                          _controller3.text,
                          _controller4.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (
                              context) => const IndexPage()),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لديك حساب؟ ',
                        style: const TextStyle(
                            color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: mainColor,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}