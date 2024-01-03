import 'package:employees/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final Function() onPresses;
  final String text;
  final Color background;
  const CustomButton({super.key, required this.onPresses, required this.text, required this.background});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => background),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
          onPressed: onPresses, child: CustomText(text: text,fontWeight: FontWeight.bold,fontSize: 20,textColor: Colors.white,)),
    );
  }
}
