import 'package:flutter/material.dart';
import 'package:whatsapp/util/color.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: tabColor),
    );
  }
}
