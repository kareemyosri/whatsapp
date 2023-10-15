
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/color.dart';
import '../../manager/cubit/phone_auth_cubit.dart';

class ShowCodeCountry extends StatelessWidget {
  const ShowCodeCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return  CountryCodePicker(
      onChanged: (c) {

        BlocProvider.of<PhoneAuthCubit>(context).codeCountry = c.dialCode!;
      },
      textStyle:const TextStyle(color: textColor), // تطبيق لون النص هنا
      dialogTextStyle:const TextStyle(
        color: textColor,
      ),
      initialSelection: '+20',
      boxDecoration:const BoxDecoration(
        color: backgroundColor,
      ),
      alignLeft: false,

      //  dialogBackgroundColor: backgroundColor,
    );
  }
}




