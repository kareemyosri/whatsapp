import 'package:flutter/material.dart';

import '../../data/model/story_model.dart';

class StoriesAllFriend extends StatelessWidget {
  const StoriesAllFriend({super.key, required this.storyModel,});
  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(backgroundImage: NetworkImage(storyModel.imageurl!)),
      title:  Text(storyModel.name,style:const   TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),),
      subtitle:  Text('9:02 pm',style:  TextStyle(
        color: Colors.white.withOpacity(.5),
        // fontWeight: FontWeight.bold,
        // fontSize: 16
      ),),
    );
  }
}