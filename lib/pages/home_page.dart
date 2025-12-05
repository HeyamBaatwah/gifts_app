import 'package:flutter/material.dart';
import 'package:gifts_app/logic/product.dart';
import 'package:gifts_app/widgets/category_box.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:gifts_app/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> user_info;
  const HomePage({super.key, required this.user_info,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Color color =  Colors.black12;
    List < Map<String,dynamic> > ads = [
      {
        'dotColor' : mainColor,
        'adsColor' : Colors.blue,
      },
      {
        'dotColor' : mainGrey,
        'adsColor' : Colors.red,
      },
      {
        'dotColor' : mainGrey,
        'adsColor' : Colors.orange,
      },
    ];
    List categories = [
      ['assets/3d_rendering_of_delicious_cheese_burger___Free_PSD-removebg-preview.png', 'بالونات'],
      ['assets/_sushi-removebg-preview.png', 'حلويات'],
      ['assets/Screenshot_2025-07-03_192038-removebg-preview.png', 'هدايا'],
      ['assets/Screenshot_2025-07-03_194837-removebg-preview.png', 'ورد'],
    ];
    List products = [
      Product(name: 'توليب', price: 20.00, image: 'assets/3d_rendering_of_delicious_cheese_burger___Free_PSD-removebg-preview.png'),
      Product(name: 'شوكولاته', price: 30.00, image: 'assets/_sushi-removebg-preview.png'),
      Product(name: 'هدية', price: 50.00, image: 'assets/Screenshot_2025-07-03_192038-removebg-preview.png'),
      Product(name: 'بالونات HBD', price: 10.00, image: 'assets/Screenshot_2025-07-03_194837-removebg-preview.png')
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.account_circle, color: mainColor, size: 60,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('مرحباً ${widget.user_info['username']}', style: TextStyle(color: Colors.black, fontSize: 30,), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                  Text('اختر الهدايا المناسبة لمناسباتك', style: TextStyle(color: mainGrey, fontSize: 20,), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                ],
              )
            ],
          ),
          SizedBox(height: 30,),
          Container(
            height: 220,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(ads.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      color = ads[index]['adsColor'];
                      for(int i=0; i<ads.length; i++) {
                        ads[i]['dotColor'] = i == index ? mainColor : mainGrey;
                      }
                    });
                  },
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: ShapeDecoration(shape: CircleBorder(), color: ads[index]['dotColor'],),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(categories.length, (index) {
              return CategoryBox(icon: categories[index][0], title: categories[index][1]);
            }),
          ),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {

                },
                child: Text('المزيد', style: TextStyle(color: mainColor, fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), textDirection: TextDirection.rtl, textAlign: TextAlign.right,)
              ),
              Text('الأكثر شعبية', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl, textAlign: TextAlign.right,)
            ],
          ),
          SizedBox(height: 10,),
          ProductCard(product: products[0])

        ],
      ),
    );
  }
}
