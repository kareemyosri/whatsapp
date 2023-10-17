

import 'package:flutter/material.dart';
import 'package:whatsapp/auth/screens/widget/phone_login_body.dart';

import '../../util/color.dart';

class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({super.key, });
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: PhoneLoginScreenBody(controller: TextEditingController(),)
           ),
    );
  }

 
}





