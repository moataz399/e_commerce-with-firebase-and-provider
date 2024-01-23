import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/delivery_method.dart';
import 'package:e_commerce/models/shipping_address_model.dart';
import 'package:e_commerce/utils/helpers/extensions.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/utils/routing/routes.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:e_commerce/views/widgets/app_text_button.dart';
import 'package:e_commerce/views/widgets/check_out/shiping_address_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/check_out/check_out_order_details.dart';
import '../../widgets/check_out/delivery_method.dart';
import '../../widgets/check_out/payment_component.dart';
import '../../widgets/loading_page.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
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
                'Shipping Address',
                style: TextStyles.font16BlackRegular,
              ),
              verticalSpace(20.h),
              StreamBuilder<List<ShippingAddressModel>>(
                  stream: database.getShippingAddresses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final shippingAddresses = snapshot.data;

                      if (shippingAddresses == null ||
                          shippingAddresses.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              const Text('no shipping address!'),
                              TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 26.w),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      Routes.addShippingAddressPage,
                                      arguments: database);
                                },
                                child: Text(
                                  'Add new shipping address',
                                  style: TextStyles.font14DarkRedMedium,
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      // final shippingAddress = shippingAddresses
                      //     .firstWhere((element) => element.isDefault == true);
                      return ShippingAddressComponent(
                        shippingAddressModel: shippingAddresses[0],
                        database: database,
                      );
                    }
                    return const LoadingPage();
                  }),
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
                    onPressed: () {
                      context.pushNamed(Routes.paymentMethodsPage);
                    },
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
                'Delivery Methods',
                style: TextStyles.font16BlackRegular,
              ),
              verticalSpace(20.h),
              StreamBuilder<List<DeliveryMethodModel>>(
                  stream: database.deliveryMethods(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final data = snapshot.data;

                      if (data == null || data.isEmpty) {
                        return const Center(
                          child: Text(
                              'delivery methods is not available right now '),
                        );
                      }
                      return SizedBox(
                        height: 125.h,
                        child: ListView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DeliveryMethodItem(
                                  deliveryMethodModel: data[index],
                                ),
                              );
                            }),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }),
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
