import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.text, required this.width, required this.onPressed});
  final String text;
  final double width;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: tabColor,
            fixedSize: Size(width, 12.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22))),
        child:  Text(
         text,
          style:const TextStyle(color: blackColor),
        ),
      ),
    );
  }
}
