
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/color.dart';
import '../../data/model/message_model.dart';





class BuildMessage extends StatelessWidget {
  const BuildMessage({super.key, required this.messageModl});
  final MessageModl messageModl;

   Widget build(BuildContext context) {
   final String dateTimeString = messageModl.date;

final List<String> dateTimeParts = dateTimeString.split(' ');
final String timeString = dateTimeParts[1].substring(0, 5);


    return Align(
      alignment: messageModl.uid == FirebaseAuth.instance.currentUser!.uid ? Alignment.centerLeft :Alignment.centerRight ,
      child: Container(
      
          margin:
          messageModl.uid == FirebaseAuth.instance.currentUser!.uid  ? EdgeInsets.only(right: MediaQuery.of(context).size.width* .16,left: 8.w,top: 12.h):
          EdgeInsets.only(left: MediaQuery.of(context).size.width* .16,right: 8.w,top: 12.h),
        decoration: BoxDecoration(
          color:  messageModl.uid == FirebaseAuth.instance.currentUser!.uid?messageColor :senderMessageColor,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(messageModl.message,style: TextStyle(color: textColor,fontSize: 16.sp,fontWeight: FontWeight.normal),),
         const   SizedBox(height: 4),
             Text(timeString,style: TextStyle(color: greyColor,fontSize: 12.sp),)
        
          ],
        ),
      ),
    );
  }


}
