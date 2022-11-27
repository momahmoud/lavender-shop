import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color btnColor;
  final Color txtColor;
  final double fontSize;
  final double elevation;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.btnColor,
    required this.txtColor,
    required this.fontSize,
    this.elevation = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      onPressed: () {
        onPressed();
      },
      padding: const EdgeInsets.symmetric(horizontal: 70),
      color: btnColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: txtColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
