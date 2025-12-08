import 'package:flutter/material.dart';
import 'package:gifts_app/logic/product.dart';
import 'package:gifts_app/widgets/circular_button.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:gifts_app/widgets/product_card.dart';
import '../logic/app_lists.dart';
import '../widgets/category_box.dart';

class SearchPage extends StatefulWidget {
  final Map<String, dynamic> user_info;
  const SearchPage({super.key, required this.user_info,});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  TextEditingController _controller1 = TextEditingController();
  static List<Product> products = List.from(AppLists.productsList);

  void changeCategory(String category) {
    setState(() {
      products.clear();
      for(Product p in AppLists.productsList) {
        if(p.category.contains(category)){
          products.add(p);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircularButton(icon: Icons.filter_list_off, action: (){
                    setState(() {
                      products = List.from(AppLists.productsList);
                    });
                  }),
                  SizedBox(width: 20,),
                  CircularButton(icon: Icons.favorite_rounded, action: (){
                    setState(() {
                      products.clear();
                      for(Product p in AppLists.productsList) {
                        if(p.isLiked){
                          products.add(p);
                        }
                      }
                    });
                  }),],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${widget.user_info['username']}', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(width: 20,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.user_info['username'].trim().substring(0, 1),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: mainColor,
                          fontFamily: 'Cairo',
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 50,
            child: TextField(
              controller: _controller1,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'البحث',
                hintStyle: TextStyle(color: mainGrey, fontSize: 18),
                hintTextDirection: TextDirection.rtl,
                suffixIcon: Icon(Icons.search, color: mainColor,),
                icon: SizedBox(
                  height: 50,
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        products.clear();
                        for(Product p in AppLists.productsList) {
                          if(p.name.contains(_controller1.text.trim())){
                            products.add(p);
                          }
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                    ),
                    child: Text('بحث', style: TextStyle(color: Colors.white, fontSize: 15),),
                  ),
                ),
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
              return CategoryBox(icon: AppLists.categories[index][0], title: AppLists.categories[index][1], action: (){
                changeCategory(AppLists.categories[index][1]);
              },);
            }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (products.length / 2).ceil(),
              itemBuilder: (context, index) {
                int first = index * 2;
                int second = first + 1;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: second < products.length
                            ? ProductCard(product: products[second])
                            : const SizedBox(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ProductCard(product: products[first]),
                      ),
                    ],
                  ),
                );
              },
            )
          )
        ],
      ),
    );
  }
}
