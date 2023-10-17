import 'package:flutter/material.dart';
import 'package:whatsapp/util/color.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
    required this.textInputType,
  });
  final Function(String) onChanged;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: tabColor,
      onChanged: onChanged,
      keyboardType: textInputType,
      textDirection: TextDirection.ltr,
      style: const TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: tabColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: tabColor),
        ),
      ),
    );
  }
}
