import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomToGeneratStory extends StatelessWidget {
  const CustomBottomToGeneratStory(
      {super.key,
      required this.icon,
      required this.color,
      required this.colorIcon,
      required this.onTap});
  final IconData icon;
  final Color color;
  final Color colorIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h, right: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Icon(
          icon,
          size: 24,
          color: colorIcon,
        ),
      ),
    );
  }
}
