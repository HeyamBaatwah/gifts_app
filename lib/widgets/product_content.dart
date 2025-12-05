import 'package:flutter/material.dart';
import 'package:gifts_app/widgets/colors.dart';

class ProductContent extends StatelessWidget {
  final String image;
  final String name;
  const ProductContent({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name, style: TextStyle(color: Colors.black, fontSize: 20,), textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
        SizedBox(width: 15,),
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: pageColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(image),
        ),
      ],
    );
  }
}
