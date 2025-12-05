import 'package:flutter/material.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:gifts_app/widgets/product_card.dart';

import '../logic/app_lists.dart';
import '../widgets/category_box.dart';

class SearchPage extends StatefulWidget {
  final Map<String, dynamic> user_info;
  const SearchPage({super.key, required this.user_info});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${widget.user_info['username']}', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(width: 20,),
              Icon(Icons.account_circle, color: mainColor, size: 50,),
            ],
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 50,
            child: TextField(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'البحث',
                hintStyle: TextStyle(color: mainGrey, fontSize: 18),
                hintTextDirection: TextDirection.rtl,
                suffixIcon: Icon(Icons.search, color: mainColor,),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none
                )
              ),
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(AppLists.categories.length, (index) {
              return CategoryBox(icon: AppLists.categories[index][0], title: AppLists.categories[index][1]);
            }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (AppLists.productsList.length/2).toInt(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: ProductCard(product: AppLists.productsList[index*2])),
                      SizedBox(width: 20,),
                      Expanded(child: ProductCard(product: AppLists.productsList[index*2+1])),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
