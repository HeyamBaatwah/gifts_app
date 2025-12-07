import 'package:flutter/material.dart';
import 'package:gifts_app/pages/details_page.dart';
import 'package:gifts_app/logic/app_lists.dart';
import 'package:gifts_app/pages/search_page.dart';
import 'package:gifts_app/widgets/category_box.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:gifts_app/widgets/product_card.dart';
import '../widgets/ads.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> user_info;
  final Function(int, String) onChangeTab;
  const HomePage({super.key, required this.user_info, required this.onChangeTab,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Ads currentAds = AppLists.adsList[0];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
      child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.account_circle, color: mainColor, size: 60,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('اهلاً ${widget.user_info['username']}', style: TextStyle(color: Colors.black, fontSize: 28,), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                  Text('قم باختيار افضل الهدايا لمناسباتك', style: TextStyle(color: mainGrey, fontSize: 18,), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                ],
              )
            ],
          ),
          SizedBox(height: 30,),
          Container(
            height: 220,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: currentAds,
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(AppLists.adsList.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentAds = AppLists.adsList[index];
                    for(int i = 0; i < AppLists.adsList.length; i++) {
                      AppLists.adsList[i].buttonColor = i == index ? mainColor : mainGrey;
                    }
                  });
                },
                child: Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.all(2),
                  decoration: ShapeDecoration(
                    color: AppLists.adsList[index].buttonColor,
                    shape: CircleBorder()
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(AppLists.categories.length, (index) {
              return CategoryBox(icon: AppLists.categories[index][0], title: AppLists.categories[index][1], action: () {
                widget.onChangeTab(1, AppLists.categories[index][1]);
              });
            }),
          ),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    widget.onChangeTab(1, '');
                  },
                  child: Text('المزيد', style: TextStyle(color: mainColor, fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), textDirection: TextDirection.rtl, textAlign: TextAlign.right,)
              ),
              Text('الأكثر شعبية', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl, textAlign: TextAlign.right,)
            ],
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: AppLists.productsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ProductCard(product: AppLists.productsList[index]),
                );
              },
            ),
          ),

        ],
      ),
      )
    );

  }
}
