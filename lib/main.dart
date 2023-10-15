
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp/shrde/my_shard_prefrence.dart';
import 'package:whatsapp/story/cubit/story_cubit.dart';
import 'package:whatsapp/story/view/screen/story_details_screen.dart';
import 'package:whatsapp/story/view/screen/test.dart';
import 'package:whatsapp/util/app_router.dart';
import 'package:whatsapp/util/bloc_observe.dart';
import 'auth/manager/cubit/phone_auth_cubit.dart';
import 'firebase_options.dart';

String? initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    await MySharedPrefrence.init();

  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = AppRouter.screenAgreeToCondation;
    } else {

      initialRoute =   AppRouter.homeScreen;
    }
  });
  Bloc.observer = const AppBlocObserver();
  runApp(const Whatsapp());
}

class Whatsapp extends StatelessWidget {
  const Whatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhoneAuthCubit(),
        ),
        BlocProvider(
          create: (context) => StoryCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize:const  Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
        
          debugShowCheckedModeBanner: false,
          //onGenerateRoute: AppRouter.generateRoute,
          //initialRoute: initialRoute,
          home: StoryScreen(),
        ),
      ),
    );
  }
}
