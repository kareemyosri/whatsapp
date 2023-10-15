
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/screens/otp_screen.dart';
import '../auth/screens/phone_login_screen.dart';
import '../auth/screens/screen_agree_to_condation.dart';
import '../home/screens/chat.dart';
import '../home/screens/home_screen.dart';
import '../profile/data/model/profile_model.dart';
import '../profile/data/repo/home_repo_imple.dart';
import '../profile/manager/cubit/profile_cubit.dart';
import '../profile/screens/profile_screen.dart';

class AppRouter {
  static const String screenAgreeToCondation = '/screenAgreeToCondation';
  static const String phoneLoginScreen = '/honeLoginScreen';
  static const String otpScreen = '/otpScreen';
  static const String profileScreen = '/profileScreen';
  static const String homeScreen = '/homescreen';
  static const String chatScreen = '/chatscreen';

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case screenAgreeToCondation:
        return MaterialPageRoute(
            builder: (_) => const ScreenAgreeToCondation());
      case phoneLoginScreen:
        return MaterialPageRoute(builder: (_) => const PhoneLoginScreen());
      case otpScreen:
        return MaterialPageRoute(builder: (_) => const OTOScreen());
      case profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => ProfileCubit(
                    HomeRepoImple(),
                  ),
              child: const ProfileScreen()),
        );
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case chatScreen:
      final user = settings.arguments as ProfileModel;
        return MaterialPageRoute(builder: (_) =>   ChatScreen(dataofUser: user,));
    }
  }
}
