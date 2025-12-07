import 'package:flutter/material.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:gifts_app/widgets/circular_button.dart';
import 'package:gifts_app/widgets/main_button.dart';
import 'package:gifts_app/pages/get_started.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @	override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String username = "وديان";
  String email = "wedyan@gmail.com";
  String phone = "770005011";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'تفاصيل الحساب',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        leading: CircularButton(
          icon: Icons.arrow_back_ios_new_rounded,
          action: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 🔹 الجزء العلوي: صورة الملف الشخصي (أعلى ما يمكن)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    username.trim().substring(0, 1),
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w600,
                      color: mainColor,
                      fontFamily: 'Cairo',
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 🔹 باقي البيانات
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      const Text(
                        'اسم المستخدم',
                        style: TextStyle(
                          color: mainGrey,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        email,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      const Text(
                        'ايميل',
                        style: TextStyle(
                          color: mainGrey,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        phone,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      const Text(
                        'جوال',
                        style: TextStyle(
                          color: mainGrey,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  const Spacer(), // يدفع الزر للأسفل
                  MainButton(
                    title: 'تسجيل الخروج',
                    bgColor: mainColor,
                    titleColor: Colors.white,
                    action: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', false);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const GetStarted()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}