
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/story_cubit.dart';

class MyStory extends StatelessWidget {
  const MyStory({super.key,  });
  @override
  Widget build(BuildContext context) {
   return  ListTile(
      onTap: (){
        BlocProvider.of<StoryCubit>(context).uploadImage(context);
      },
      contentPadding: EdgeInsets.zero,
      leading:
      const CircleAvatar(
              backgroundImage: AssetImage('image/defultImage.png'))
         ,
      title: Text(
        'My Status',
        style: TextStyle(
            color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Tap to add statues update',
        style: TextStyle(
            color: Colors.white.withOpacity(.5),
            fontSize: 14.sp,
            fontWeight: FontWeight.normal),
      ),
    ) ;
  }
}
