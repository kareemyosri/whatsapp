
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../profile/data/model/profile_model.dart';
import '../../../util/color.dart';
import '../../../util/flutter_tost.dart';

class CustomAPPBarToChat extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAPPBarToChat({super.key, required this.user});
  final ProfileModel user;
  @override
  Widget build(BuildContext context) {
        final phoneNumber =
        Uri.parse("tel:${user.phoneNumber}"); 

    return AppBar(
      elevation: 0,
      leadingWidth: 25.w,
      backgroundColor: backgroundColor,
      title: Row(
        children: [
          CircleAvatar(
            //   radius: 16,
            backgroundImage: NetworkImage(user.photo),
          ),
          const SizedBox(width: 12),
          Text(
            user.name,
            style: TextStyle(color: textColor, fontSize: 16.sp),
          ),
          const Spacer(flex: 1),
           IconButton(
              onPressed: () async {
                try {
                  await launchUrl(phoneNumber);
                } catch (e) {
                  flutterTost('Could not launch ${e.toString()}');
                }
               
              },
              icon: const Icon(
                Icons.phone,
                size: 24,
                color: Colors.white,
              )),
          SizedBox(width: 6.w)
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
