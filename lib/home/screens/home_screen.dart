
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/home/screens/widget/custom_appbar.dart';
import 'package:whatsapp/home/screens/widget/home_page_body.dart';

import '../../util/color.dart';
import '../manager/cubit/users_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit()..getAllUsers(),
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar:  CustomTabBar(),
          body:HomeBageBody(),
        ),
      ),
    );
  }
}


