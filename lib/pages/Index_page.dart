import 'package:flutter/material.dart';
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
  final List<Widget> _pages = [
    HomePage(user_info: {
      'username' : 'هيام',
      'password' : '12345',
      'email' : 'heyambaatwah@gmail.com'
    }),
    SearchPage(),
    CartPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      body: IndexedStack(
        index: _navIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (index){
          setState(() {
            _navIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: mainColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(label: '', icon: Icon(Icons.home_outlined, size: 30,),),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.search, size: 30,),),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.shopping_bag_outlined, size: 30,),),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.person_outline, size: 30,),),
        ],
      ),
    );
  }
}
