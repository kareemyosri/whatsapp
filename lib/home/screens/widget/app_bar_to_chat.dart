
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../profile/data/model/profile_model.dart';
import '../../../util/color.dart';

class CustomAPPBarToChat extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAPPBarToChat({super.key, required this.user});
  final ProfileModel user;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 25.w,
      backgroundColor: backgroundColor,
      title: Row(
        children: [
           CircleAvatar(
         //   radius: 16,
            backgroundImage: NetworkImage(
               user.photo),
          ),
          const SizedBox(width: 12),
          Text(
            user.name,
            style: TextStyle(color: textColor, fontSize: 16.sp),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
