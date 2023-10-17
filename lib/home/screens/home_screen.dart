
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/home/screens/widget/custom_appbar.dart';
import 'package:whatsapp/home/screens/widget/home_page_body.dart';

import '../../story/cubit/story_cubit.dart';
import '../../story/view/screen/story_screen.dart';
import '../../util/color.dart';
import '../manager/cubit/users_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsersCubit()..getAllUsers(),
        ),
        BlocProvider(
          create: (context) => StoryCubit(),
        ),
      ],
      child: const SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: CustomTabBar(),
            body: TabBarView(
              children: [HomeBageBody(), StoryScreen()],
            ),
          ),
        ),
      ),
    );
  }
}
