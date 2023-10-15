import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color.dart';

void flutterTost(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: blackColor,
    textColor: textColor,
  );
}

void customShowDilog(BuildContext context) {
  showDialog(
      context: context,
    //  barrierColor: Colors.black54.withOpacity(.4),
      barrierColor: backgroundColor.withOpacity(.5),
      builder: (context) => AlertDialog(

          backgroundColor:const Color(0xff2A3B45),
      
            title: Text(
              'Please enter your phone numver',
              style: TextStyle(
                color: Colors.grey.withOpacity(.5),
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
            actions: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text('ok',style: TextStyle(
                  color: tabColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300
                ),),
              )
            ],
          ));
}
