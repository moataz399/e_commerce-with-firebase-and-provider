import 'package:flutter/material.dart';

import '../../utils/theming/text_styles.dart';

class AlreadyHaveAccountTextRegister extends StatelessWidget {
  AlreadyHaveAccountTextRegister({super.key, required this.function});

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
              text: 'Already have an account?',
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
              text: ' Login',
              style:
                  TextStyles.font13BlueSemiBold.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
