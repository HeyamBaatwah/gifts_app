import 'package:gifts_app/logic/product.dart';
import 'package:gifts_app/widgets/ads.dart';
import 'package:gifts_app/widgets/colors.dart';

class AppLists {
  static List categories = [
    ['assets/balloons_icon.png', 'بالونات'],
    ['assets/cake_icon.png', 'حلويات'],
    ['assets/gift_icon.png', 'هدايا'],
    ['assets/bouquet_icon.png', 'ورد'],
  ];

  static List<Product> productsList = [
    Product(name: 'توليب', price: 20.0, image: 'assets/bouquet_icon.png'),
    Product(name: 'توليب', price: 20.0, image: 'assets/bouquet_icon.png'),
    Product(name: 'توليب', price: 20.0, image: 'assets/bouquet_icon.png'),
    Product(name: 'توليب', price: 20.0, image: 'assets/bouquet_icon.png'),
    Product(name: 'توليب', price: 20.0, image: 'assets/bouquet_icon.png'),
    Product(name: 'توليب', price: 20.0, image: 'assets/bouquet_icon.png'),
    Product(name: 'توليب', price: 20.0, image: 'assets/bouquet_icon.png'),
    Product(name: 'توليب', price: 20.0, image: 'assets/bouquet_icon.png'),
  ];

  static List<Ads> adsList = [
    Ads(title: 'عرض حصري يصل الى 30%', description: 'استمتع بالعرض الكبير الخاص بنا كل يوم', image: 'assets/bouquet_icon.png', buttonColor: mainColor,),
    Ads(title: 'عرض حصري يصل الى 30%', description: 'استمتعم', image: 'assets/balloons_icon.png'),
    Ads(title: 'عرض حصري يصل الى 30%', description: 'استمتع بالعرض الكبير الخاص بنا كل يوم', image: 'assets/cake_icon.png'),
    Ads(title: 'عرض حصري يصل الى 30%', description: 'استمتع بالعرض الكبير الخاص بنا كل يوم', image: 'assets/gift_icon.png'),
  ];



}