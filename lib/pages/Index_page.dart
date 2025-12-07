import 'package:flutter/material.dart';
import 'package:gifts_app/logic/app_lists.dart';
import 'package:gifts_app/logic/login_methods.dart'; // ← مهم
import 'package:gifts_app/pages/account_page.dart';
import 'package:gifts_app/pages/cart_page.dart';
import 'package:gifts_app/pages/home_page.dart';
import 'package:gifts_app/pages/search_page.dart';
import 'package:gifts_app/widgets/colors.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _navIndex = 0;
  late Future<Map<String, String>> _userInfoFuture; // ← نستخدم Future مباشرة
  final GlobalKey<SearchPageState> searchKey = GlobalKey<SearchPageState>();

  @override
  void initState() {
    super.initState();
    _userInfoFuture = LogInMethods.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      body: FutureBuilder<Map<String, String>>(
        future: _userInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: mainColor));
          }
          if (snapshot.hasError) {
            return Center(child: Text('خطأ: ${snapshot.error}'));
          }
          final userInfo = snapshot.data!;
          final _pages = [
            HomePage(
              user_info: userInfo,
              onChangeTab: (index, category) {
                setState(() {
                  searchKey.currentState?.changeCategory(category);
                  _navIndex = index;
                });
              },
            ),
            SearchPage(
              key: searchKey,
              user_info: userInfo,
            ),
            CartPage(onBack: () {
              setState(() {
                _navIndex = 1;
              });
            }),
            AccountPage(onBack: () {
              setState(() {
                _navIndex = 0;
              });
            }),
          ];

          return IndexedStack(
            index: _navIndex,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: mainColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 30), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined, size: 30), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 30), label: ''),
        ],
      ),
    );
  }
}