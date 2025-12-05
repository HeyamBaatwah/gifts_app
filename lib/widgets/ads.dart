import 'package:flutter/material.dart';
import 'package:gifts_app/widgets/colors.dart';

class Ads extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  Color buttonColor;
  Ads({super.key, required this.title, required this.description,  required this.image, this.buttonColor = mainGrey});

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
                Text(widget.description, style: TextStyle(color: mainGrey, fontSize: 18,), textAlign: TextAlign.right, textDirection: TextDirection.rtl,),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Image.asset(widget.image)
          ),
        ],
      ),
    );
  }
}
