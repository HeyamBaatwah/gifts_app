import 'package:shared_preferences/shared_preferences.dart';

class LogInMethods {
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف أو أكثر';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'يجب أن تحتوي على ارقام';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'يجب أن تحتوي على حرف صغير واحد على الأقل';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'يجب أن تحتوي على رقم واحد على الأقل';
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'يجب أن تحتوي على رمز ( ! @ # \$ & * ~ )';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'اسم المستخدم مطلوب';
    else return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'البريد الإلكتروني مطلوب';
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value)) return 'البريد الإلكتروني غير صالح';
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'رقم الجوال مطلوب';
    final regex = RegExp(r'^\+?[0-9]{8,15}$');
    if (!regex.hasMatch(value)) return 'رقم الجوال غير صالح';
    return null;
  }

  static saveInfo(String username, String password, String email, String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('email', email);
    await prefs.setString('phone', phone);
    await prefs.setBool('isLoggedIn', true);
  }

  static Future<bool> checkValue(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final userName = await prefs.getString('username');
    final passWord = await prefs.getString('password');
    if(username == userName && password == passWord) {
      await prefs.setBool('isLoggedIn', true);
      return true;
    }
    else {
      return false;
    }
  }

  static Future<Map<String, dynamic>> getUserInfo()  async {
    final prefs = await SharedPreferences.getInstance();
    final username = await prefs.getString('username');
    final email = await prefs.getString('email');
    final phone = await prefs.getString('phone');
    return {
      'username' : username!,
      'email' : email!,
      'phone' : phone!
    };
  }

}