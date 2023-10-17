
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp/auth/screens/widget/show_code_country.dart';

import '../../../util/app_router.dart';
import '../../../util/color.dart';
import '../../../util/flutter_tost.dart';
import '../../../util/widget/custom_bottom.dart';
import '../../../util/widget/custom_text_form_filed.dart';
import '../../../util/widget/loading.dart';
import '../../manager/cubit/phone_auth_cubit.dart';

class PhoneLoginScreenBody extends StatelessWidget {
  const PhoneLoginScreenBody({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Text(
          'Enter your phone number',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
          child: Row(
            children: [
              const ShowCodeCountry(),
              Expanded(
                child: CustomTextFormFiled(
                  textInputType: TextInputType.number,
                  hintText: 'Phone number',
                  onChanged: (String text) => controller.text = text,
                  controller: controller,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Carrier charges my apply',
          textAlign: TextAlign.center,
          style: TextStyle(color: greyColor),
        ),
        const Expanded(
            child: SizedBox(
          height: 12,
        )),
        BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, state) {
            if (state is PhoneNumberINValid) {
              flutterTost(state.erroeMessage);
            } else if (state is PhoneNumberValid) {
              Navigator.pushReplacementNamed(context, AppRouter.otpScreen,arguments: controller.text);
              controller.clear();
            }
          },
          builder: (context, state) {
            if (state is StateIsLoading) {
              return const Loading();
            } else {
              return _buildbottom(context);
            }
          },
        ),
        const SizedBox(height: 12)
      ],
    );
  }

  CustomBottom _buildbottom(BuildContext context) {
    return CustomBottom(
      text: 'next',
      width: 90.w,
      onPressed: () async {
       
        if (controller.text.isEmpty) {
          customShowDilog(context);
        } else {
       
            await BlocProvider.of<PhoneAuthCubit>(context)
                .phoneAuth(phoneNumber: controller.text);
        }
      },
    );
  }
}
