import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theming/text_styles.dart';

class ShippingAddressComponent extends StatelessWidget {
  const ShippingAddressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 25,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0.w, vertical: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Moataz mohamed',
                  style: TextStyles.font14BlackRegular,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: TextStyles.font14DarkRedMedium,
                  ),
                )
              ],
            ),
            verticalSpace(6),
            Text(
              '3 Newbridge Court',
              style: TextStyles.font14BlackRegular,
            ),
            Text(
              'Chino Hills, CA 91709, United States',
              style: TextStyles.font14BlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}
