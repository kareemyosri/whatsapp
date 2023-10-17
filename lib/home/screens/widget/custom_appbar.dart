import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/color.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: const Text(
        'ChatApp',
        style: TextStyle(color: textColor),
      ),
      bottom: TabBar(indicatorColor: tabColor, tabs: [
        Text(
          'Chats',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white),
        ),
        Text(
          'Updates',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white),
        ),
       
      ]),
    );
  }
}

class Storye extends StatelessWidget {
  const Storye({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Story');
  }
}

