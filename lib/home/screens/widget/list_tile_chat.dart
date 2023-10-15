
import 'package:flutter/material.dart';

import '../../../profile/data/model/profile_model.dart';
import '../../../util/app_router.dart';
import '../../../util/color.dart';

class ListTileChate extends StatelessWidget {
  const ListTileChate({super.key, required this.oneUser});
  final ProfileModel oneUser;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, AppRouter.chatScreen,arguments: oneUser),
      child: ListTile(
        leading:  CircleAvatar(
          backgroundImage: NetworkImage(
           oneUser.photo,
          ),
        ),
        title: Text(
          oneUser.name,
          style:
              Theme.of(context).textTheme.titleLarge!.copyWith(color: textColor),
        ),
      ),
    );
  }
}
