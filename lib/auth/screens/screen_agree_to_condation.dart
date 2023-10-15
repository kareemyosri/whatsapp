
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp/auth/screens/widget/text_info.dart';

import '../../util/app_router.dart';
import '../../util/color.dart';
import '../../util/widget/custom_bottom.dart';

class ScreenAgreeToCondation extends StatelessWidget {
  const ScreenAgreeToCondation({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            Image.asset(
              'image/circle.png',
              color: tabColor,
              width: 300.w,
              height: 300.h,
            ),
            SizedBox(height: 26.h),
            Text(
              'Welcome to WhatsApp',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 22.h),
            const TextInfo(),
            Expanded(
                child: SizedBox(
              height: 17.h,
            )),
             CustomBottom(
              text: 'Agree and continue',
              onPressed: (){
                Navigator.pushReplacementNamed(context, AppRouter.phoneLoginScreen);
              },width:
              MediaQuery.of(context).size.width*1,
             ),
            SizedBox(height: 6.h)
          ],
        ),
      ),
    );
  }
}

