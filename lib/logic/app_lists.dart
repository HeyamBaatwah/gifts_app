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
    Product(name: 'بالون', price: 20.0, image: 'assets/images/ballon.png', category: 'بالونات', content: []),
    Product(name: 'بالون', price: 30.0, image: 'assets/images/balloon1.png', category: 'بالونات', content: []),
    Product(name: 'بالون', price: 25.0, image: 'assets/images/balloon2.png', category: 'بالونات', content: []),
    Product(name: 'بالون', price: 15.0, image: 'assets/images/balloon3.png', category: 'بالونات', content: []),
    Product(name: 'ورد', price: 50.0, image: 'assets/images/rose.png', category: 'ورد', content: []),
    Product(name: 'ورد', price: 55.0, image: 'assets/images/rose1.png', category: 'ورد', content: []),
    Product(name: 'ورد', price: 53.0, image: 'assets/images/rose2.png', category: 'ورد', content: []),
    Product(name: 'ورد', price: 40.0, image: 'assets/images/rose3.png', category: 'ورد', content: []),
    Product(name: 'هديه', price: 60.0, image: 'assets/images/gift.png', category: 'هدايا', content: []),
    Product(name: 'هديه', price: 67.0, image: 'assets/images/gift1.png', category: 'هدايا', content: []),
    Product(name: 'هديه', price: 80.0, image: 'assets/images/gift2.png', category: 'هدايا', content: []),
    Product(name: 'هديه', price: 65.0, image: 'assets/images/gift3.png', category: 'هدايا', content: []),
    Product(name: 'كيكه', price: 59.0, image: 'assets/images/cake.png', category: 'حلويات', content: []),
    Product(name: 'كيكه', price: 60.0, image: 'assets/images/cake1.png', category: 'حلويات', content: []),
    Product(name: 'شوكلاته', price: 40.0, image: 'assets/images/chocolate2.png', category: 'حلويات', content: []),
    Product(name: 'شوكلاته', price: 55.0, image: 'assets/images/chocolate4.png', category: 'حلويات', content: []),
  ];

  static List<Ads> adsList = [
    Ads(title: 'احتفل بنهاية العام مع أحبائك', description: 'خصومات تصل إلى 70% على جميع الهدايا الموسمية', image: 'assets/images/balloon10.png', buttonColor: mainColor,),
    Ads(title: 'شارك أجمل اللحظات مع أصدقائك', description: 'هدايا تبدأ من عشرين ريال فقط', image: 'assets/images/cake7.png'),
    Ads(title: 'لا تفوّت الفرصة', description: 'خصومات حصرية على مختارات الهدايا حتى مساء الأحد', image: 'assets/images/gift21.png'),
  ];

  static List<Product> productInCart = [];


}