import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theming/text_styles.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(
              "https://1000logos.net/wp-content/uploads/2017/03/MasterCard-Logo-1990.png",
              fit: BoxFit.cover,
              height: 40.h,
            ),
          ),
        ),
        horizontalSpace(16),
        Text(
          "**** **** **** 3947",
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
