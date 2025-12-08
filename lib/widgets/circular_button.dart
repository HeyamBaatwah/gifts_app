import 'package:flutter/material.dart';
import 'package:gifts_app/widgets/colors.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Function action;
  const CircularButton({super.key, required this.icon, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder()
      ),
      child: IconButton(
        onPressed: () {
          action();
        },
        icon: Icon(icon, color: mainGrey,),
      ),
    );
  }
}
