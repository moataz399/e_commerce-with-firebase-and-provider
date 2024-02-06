import 'package:e_commerce/utils/helpers/extensions.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:e_commerce/views/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/routing/routes.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Test",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(children: [
          AppTextButton(
            buttonText: "chat page 1 ",
            textStyle: TextStyles.font11greySemiBold,
            onPressed: () {
              context.pushNamed(Routes.chatPage);
            },
          ),
          SizedBox(
            height: 120,
          ),
          AppTextButton(
            buttonText: "chat page 2 ",
            textStyle: TextStyles.font11greySemiBold,
            onPressed: () {
              context.pushNamed(Routes.chatPage2);
            },
          ),
        ]),
      ),
    );
  }
}
