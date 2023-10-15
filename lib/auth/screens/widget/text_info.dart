
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../util/color.dart';
import '../../../util/flutter_tost.dart';


class TextInfo extends StatelessWidget {
  const TextInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <InlineSpan>[
            const TextSpan(
              text: 'Read our ',
              style: TextStyle(
                color: greyColor,
              ),
            ),
            TextSpan(
                text: 'Privacy Policy.',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color(0xff5EBAE1),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await _urLuncher(
                        'https://www.whatsapp.com/legal/privacy-policy?lg=en&lc=ZZ&eea=0');
                  }),
            const TextSpan(
              text: ' Accept and continue to\n',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: greyColor,
              ),
            ),
            const TextSpan(
              text: 'accept th ',
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: greyColor, height: 1.5),
            ),
            TextSpan(
                text: 'Terms of Service',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color(0xff5EBAE1),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await _urLuncher(
                        'https://www.whatsapp.com/legal/terms-of-service?lg=en&lc=ZZ&eea=0');
                  }),
          ],
        ),
      ),
    );
  }

  Future<void> _urLuncher(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } on Exception catch (e) {
      flutterTost(e.toString());
    }
  }
}
