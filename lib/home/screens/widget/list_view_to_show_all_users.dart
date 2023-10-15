
import 'package:flutter/widgets.dart';

import '../../../profile/data/model/profile_model.dart';
import 'list_tile_chat.dart';

class CustomListViewToShowAllUser extends StatelessWidget {
  const CustomListViewToShowAllUser({
    super.key,
    required this.allUseres,
  });
  final List<ProfileModel> allUseres;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allUseres.length,
      itemBuilder: (context, index) => ListTileChate(
        oneUser: allUseres[index],
      ),
    );
  }

  // ListView _buildListViewToShowAllUsers(
  //     {required List<ProfileModel> allUseres}) {
  //   return ListView.builder(
  //       itemCount: allUseres.length,
  //       itemBuilder: (context, index) => ListTileChate(
  //             oneUser: allUseres[index],
  //           ));
  // }
}
