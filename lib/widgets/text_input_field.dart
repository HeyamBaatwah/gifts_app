import 'package:flutter/material.dart';
import 'package:gifts_app/widgets/colors.dart';

class TextInputField extends StatefulWidget {
  final String title;
  final String hint;
  final Function validator;
  const TextInputField({super.key, required this.title, required this.hint, required this.validator});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: TextFormField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(color: mainGrey, fontSize: 16, fontWeight: FontWeight.bold),
              hintTextDirection: TextDirection.rtl,
              filled: true,
              fillColor: pageColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: mainColor, width: 2),
              ),
            ),
            validator: widget.validator()
          ),
        ),
      ],
    );
  }
}
