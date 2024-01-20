import 'package:e_commerce/models/shipping_address.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theming/text_styles.dart';

class ShippingAddressComponent extends StatelessWidget {
  const ShippingAddressComponent(
      {super.key, required this.shippingAddressModel});

  final ShippingAddressModel shippingAddressModel;

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
                  shippingAddressModel.fullName,
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
              shippingAddressModel.address,
              style: TextStyles.font14BlackRegular,
            ),
            Text(
              '${shippingAddressModel.city},${shippingAddressModel.state},${shippingAddressModel.country}',
              style: TextStyles.font14BlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}
