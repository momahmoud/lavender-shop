import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final dynamic imageIcon;
  final String hint;
  final TextEditingController controller;
  final Function validator;
  final Function? onSubmit;
  final bool secureText;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final TextInputType? textInputType;

  const TextFormFieldWidget({
    Key? key,
    this.imageIcon,
    required this.hint,
    required this.controller,
    required this.validator,
    this.secureText = false,
    this.suffixIcon,
    this.textInputType,
    this.prefixIcon,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onFieldSubmitted: (value) {
          onSubmit!();
        },
        keyboardType: textInputType,
        obscureText: secureText,
        validator: (String? val) => validator(val),
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[900],
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
