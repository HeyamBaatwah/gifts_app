import 'package:flutter/material.dart';
import 'package:gifts_app/logic/app_lists.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:gifts_app/widgets/main_button.dart';
import 'package:gifts_app/widgets/product_in_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // حساب المجموع
  double get totalAmount {
    return AppLists.productInCart.fold(0.0, (sum, product) {
      return sum + (product.price * product.quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'سلة التسوق',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: AppLists.productInCart.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 80, color: mainGrey),
            const SizedBox(height: 20),
            Text(
              'سلة فارغة',
              style: TextStyle(color: mainGrey, fontSize: 20),
            ),
          ],
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // قائمة المنتجات
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: AppLists.productInCart.length,
                itemBuilder: (context, index) {
                  final product = AppLists.productInCart[index];
                  return ProductInCart(
                    product: product,
                    deleteAction: () {
                      setState(() {
                        AppLists.productInCart.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // ملخص الفاتورة
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'المبلغ:',
                        style: TextStyle(
                          color: mainGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${totalAmount} ر.س',
                        style: TextStyle(
                          color: titleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'التوصيل:',
                        style: TextStyle(
                          color: mainGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'مجّاناً',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(color: mainGrey.withOpacity(0.3)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'المجموع:',
                        style: TextStyle(
                          color: mainGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${totalAmount} ر.س',
                        style: TextStyle(
                          color: titleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // زر الدفع
            MainButton(
              title: 'إنتقل للدفع',
              bgColor: mainColor,
              titleColor: Colors.white,
              action: () {
                // يمكنك توجيه المستخدم إلى صفحة الدفع
                // أو عرض SnackBar مؤقتاً
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('تم الانتقال إلى صفحة الدفع'),
                    backgroundColor: mainColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}