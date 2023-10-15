
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/color.dart';
import '../../manager/cubit/users_cubit.dart';

class BuildTextFiledToSendMessage extends StatelessWidget {
  const BuildTextFiledToSendMessage(
      {super.key, required this.controller,  required this.idReciver});
  final TextEditingController controller;
  final String idReciver;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Row(
        children: [
          const SizedBox(width: 6),
          Expanded(

            child: TextField(
            
              controller: controller,
              cursorColor: tabColor,
              style: const TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: const TextStyle(color: textColor),
                filled: true,
                fillColor: const Color(0xff1F2C34),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(30.0),
                ),
             
              ),
            ),
          ),
          const SizedBox(width: 6),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: tabColor,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  BlocProvider.of<UsersCubit>(context).sendMessage(
                      idUser: idReciver,
                      message: controller.text,
                      uid: FirebaseAuth.instance.currentUser!.uid,
                      date: DateTime.now().toString());
                
                }
              },
              child: const Icon(
                Icons.send,
                size: 24,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
