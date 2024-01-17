import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:e_commerce/views/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/check_out/check_out_order_details.dart';
import '../widgets/check_out/delivery_method.dart';
import '../widgets/check_out/payment_component.dart';
import '../widgets/check_out/shiping_address_component.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF9F9F9),
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
          style: TextStyles.font18BlackRegular,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping address',
                style: TextStyles.font16BlackRegular,
              ),
              verticalSpace(20.h),
              const ShippingAddressComponent(),
              verticalSpace(45.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: TextStyles.font16BlackRegular,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(horizontal: 26.w),
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
              verticalSpace(20.h),
              const PaymentComponent(),
              verticalSpace(45.h),
              Text(
                'Delivery method',
                style: TextStyles.font16BlackRegular,
              ),
              verticalSpace(20.h),
              Container(
                color: Colors.white,
                height: 100.h,
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const DeliveryMethodItem();
                    }),
              ),
              verticalSpace(45.h),
              const CheckOutOrderDetails(),
              verticalSpace(26.h),
              AppTextButton(
                  buttonText: "SUBMIT ORDER",
                  textStyle: TextStyles.font14WhiteMedium,
                  onPressed: () {})
            ],
          ),
        ),
      )),
    );
  }
}
