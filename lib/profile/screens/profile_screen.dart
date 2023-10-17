
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp/profile/screens/widget/pick_image.dart';

import '../../util/app_router.dart';
import '../../util/color.dart';
import '../../util/flutter_tost.dart';
import '../../util/widget/custom_bottom.dart';
import '../../util/widget/custom_text_form_filed.dart';
import '../../util/widget/loading.dart';
import '../manager/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            SizedBox(height: 14.h),
            Text(
              'Personal Information',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            const Text(
              'Please enter your name and select a profile picture',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: greyColor,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            const PickImage(),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: CustomTextFormFiled(
                  textInputType: TextInputType.text,
                  hintText: 'Write your name here',
                  onChanged: (String text) {
                    namecontroller.text = text;
                  },
                  controller: namecontroller),
            ),
            const Expanded(
                child: SizedBox(
              height: 12,
            )),
            BlocConsumer<ProfileCubit, ProfileState>(builder: (context, state) {
              if (state is StateIsLoading) {
                return const Loading();
              } else {
                return CustomBottom(
                  text: 'Next',
                  width: MediaQuery.of(context).size.width * .2,
                  onPressed: () async {
                    if (namecontroller.text.isNotEmpty) {
                      await BlocProvider.of<ProfileCubit>(context)
                          .updateProfile(
                            phoneNumber: phoneNumber,
                              name: namecontroller.text,
                              id: FirebaseAuth.instance.currentUser!.uid);
                    }
                  },
                );
              }
            }, listener: (context, state) {
              if (state is UpdateProfileIsFailuer) {
                flutterTost(state.erroMessage);
              } else if (state is UpdateProfileIsSuccessfult) {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouter.homeScreen,
                );
              }
            }),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    );
  }
}
