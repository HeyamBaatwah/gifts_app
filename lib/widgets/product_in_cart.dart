import 'package:flutter/material.dart';
import 'package:gifts_app/logic/product.dart';
import 'package:gifts_app/widgets/circular_button.dart';
import 'package:gifts_app/widgets/colors.dart';

class ProductInCart extends StatefulWidget {
  final Product product;
  final Function deleteAction;
  const ProductInCart({super.key, required this.product, required this.deleteAction});

  @override
  State<ProductInCart> createState() => _ProductInCartState();
}

class _ProductInCartState extends State<ProductInCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  widget.deleteAction();
                },
                icon: Icon(Icons.delete, color: mainGrey, size: 35,),
              )
            )
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.product.name, style: TextStyle(color: mainGrey, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                Text('${widget.product.price} ر.س', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
              ],
            ),
            Container(
              height: 50,
              width: 130,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularButton(icon: Icons.add, action: () {
                    setState(() {
                      widget.product.quantity++;
                    });
                  }),
                  Text('${widget.product.quantity}', style: TextStyle(color: Colors.white, fontSize: 20),),
                  CircularButton(icon: Icons.remove, action: () {
                    setState(() {
                      if(widget.product.quantity > 0) {
                        widget.product.quantity--;
                      }
                    });
                  }),
                ],
              ),
            )
          ],
        ),
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(widget.product.image)
          ),

        ],
      ),
    );
  }
}
