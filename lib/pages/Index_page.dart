import 'package:flutter/material.dart';
import 'package:gifts_app/logic/login_methods.dart';
import 'package:gifts_app/pages/account_page.dart';
import 'package:gifts_app/pages/cart_page.dart';
import 'package:gifts_app/pages/home_page.dart';
import 'package:gifts_app/pages/search_page.dart';
import 'package:gifts_app/widgets/colors.dart';

class IndexPage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const IndexPage({super.key, required this.userInfo});

  @override
  State<IndexPage> createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  int _navIndex = 0;
  late List<Widget> _pages;
  final GlobalKey<SearchPageState> searchKey = GlobalKey<SearchPageState>();
  static final GlobalKey<CartPageState> cartKey = GlobalKey<CartPageState>();
  static final GlobalKey<HomePageState> homeKey = GlobalKey<HomePageState>();

  @override
  Widget build(BuildContext context){
    _pages = [
      HomePage(
        key: homeKey,
        user_info: widget.userInfo,
        onChangeTab: (index, category) {
          setState(() {
            searchKey.currentState!.changeCategory(category);
            _navIndex = index;
          });
        },
      ),
      SearchPage(
        key: searchKey,
        user_info: widget.userInfo,
      ),
      CartPage(
        key: cartKey,
      ),
      AccountPage(
        user_info: widget.userInfo,
      )
    ];
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
