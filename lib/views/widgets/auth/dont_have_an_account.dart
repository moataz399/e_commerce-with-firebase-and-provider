import 'package:flutter/material.dart';

import '../../../utils/theming/text_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  DontHaveAccountText({super.key, required this.function});

  void Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
              text: ' Register',
              style:
                  TextStyles.font13BlueSemiBold.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
