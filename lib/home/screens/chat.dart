
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/home/screens/widget/app_bar_to_chat.dart';
import 'package:whatsapp/home/screens/widget/list_view_to_show_all_message.dart';

import '../../profile/data/model/profile_model.dart';
import '../../util/color.dart';
import '../manager/cubit/users_cubit.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.dataofUser});
  final ProfileModel dataofUser;
  @override
  Widget build(BuildContext context) {
    return BlocProvider
    (
      create: (context)=>UsersCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar:  CustomAPPBarToChat(user: dataofUser,),
          body: Stack(
            children: [
              Image.asset(
                'image/backgroundImage.png',
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.fitHeight,
              ),
              
                CustomListViewToShowAllMessaage(idUser: dataofUser.id)
    
    
              
            ],
          ),
        ),
      ),
    );
  }
}





