import 'package:flutter/material.dart';
import 'package:gifts_app/widgets/colors.dart';

class CategoryBox extends StatelessWidget {
  final String icon;
  final String title;
  const CategoryBox({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(icon),
          ),
          SizedBox(height: 5,),
          Text(title, style: TextStyle(color: mainGrey, fontSize: 18, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
