import 'package:flutter/material.dart';
import 'package:gifts_app/logic/product.dart';
import 'package:gifts_app/logic/app_lists.dart';
import 'package:gifts_app/widgets/colors.dart';
import 'package:gifts_app/widgets/circular_button.dart';
import 'package:gifts_app/widgets/main_button.dart';

class DetailsPage extends StatefulWidget {
  final Product product;

  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CircularButton(
          icon: Icons.arrow_back_ios_new_rounded,
          action: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.product.isLiked
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              color: mainColor,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                widget.product.isLiked = !widget.product.isLiked;
              });
            },
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // صورة المنتج
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 6,
                    spreadRadius: 0,
                    offset: const Offset(-4, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // الاسم والسعر
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  '${widget.product.price} ر.س',
                  style: const TextStyle(
                    color: mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            const SizedBox(height: 15),

            // قسم "تحتوي"
            const Text(
              'تحتوي',
              style: TextStyle(
                color: mainGrey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),

            // عرض المحتويات
            if (widget.product.content.isNotEmpty)
              Wrap(
                alignment: WrapAlignment.end,
                spacing: 10,
                runSpacing: 10,
                children: widget.product.content.map((item) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: pageColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      item.toString(),
                      style: const TextStyle(
                        color: mainGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                  );
                }).toList(),
              )
            else
              const Text(
                'لا يوجد محتوى محدد',
                style: TextStyle(
                  color: mainGrey,
                  fontSize: 16,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            const SizedBox(height: 25),

            // تحديد الكمية
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'الكمية',
                    style: TextStyle(color: mainGrey, fontSize: 16),
                  ),
                  Row(
                    children: [
                      CircularButton(
                        icon: Icons.remove,
                        action: () {
                          if (widget.product.quantity > 0) {
                            setState(() {
                              widget.product.quantity--;
                            });
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${widget.product.quantity}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircularButton(
                        icon: Icons.add,
                        action: () {
                          setState(() {
                            widget.product.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // زر الإضافة إلى السلة
            MainButton(
              title: 'إضافة إلى السلة (${widget.product.quantity})',
              bgColor: mainColor,
              titleColor: Colors.white,
              action: () {
                if (widget.product.quantity > 0) {
                  // نتأكد من عدم تكرار المنتج في السلة إذا أردت ذلك
                  // لكن حسب طلبك: نضيفه مباشرة
                  AppLists.productInCart.add(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'تم إضافة ${widget.product.name} (${widget.product.quantity}) إلى السلة',
                      ),
                      backgroundColor: mainColor,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('الرجاء تحديد الكمية أولاً'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}