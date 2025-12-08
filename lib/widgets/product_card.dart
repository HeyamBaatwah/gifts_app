import 'package:flutter/material.dart';
import 'package:gifts_app/logic/app_lists.dart';
import 'package:gifts_app/logic/product.dart';
import 'package:gifts_app/pages/details_page.dart';
import 'package:gifts_app/widgets/colors.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: shadowColor, blurRadius: 4, spreadRadius: 0, offset: Offset(-4, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: widget.product.isLiked? Icon(Icons.favorite_rounded, size: 30, color: mainColor,) : Icon(Icons.favorite_outline_rounded, size: 30, color: mainColor,),
            onPressed: () {
              setState(() {
                widget.product.isLiked = !widget.product.isLiked;
              });
            },
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(product: widget.product)));
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              child: Image.asset(widget.product.image, fit: BoxFit.cover,),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if(widget.product.quantity<=0) {
                      widget.product.quantity++;
                      AppLists.productInCart.add(widget.product);
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20,),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(widget.product.name, style: TextStyle(color: mainGrey, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                    Text('${widget.product.price} ر.س', style: TextStyle(color: titleColor, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.right, textDirection: TextDirection.rtl,)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
