import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/add_to_cart_model.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:e_commerce/views/widgets/app_text_button.dart';
import 'package:e_commerce/views/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/routing/routes.dart';
import '../../utils/theming/colors.dart';
import '../widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SafeArea(
        child: StreamBuilder<List<AddToCartModel>>(
            stream: database.myProductsCart(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                var cartItems = snapshot.data;
                totalAmount = 0;
                for (var element in cartItems!) {
                  totalAmount += element.price;
                }
                debugPrint(cartItems.length.toString());
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox.shrink(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                        verticalSpace(16),
                        BigText(
                          text: "My Cart",
                          color: Colors.black,
                          size: 34,
                        ),
                        if (cartItems.isEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16.0.h,
                            ),
                            child: const Center(
                              child: Text("no data available"),
                            ),
                          ),
                        if (cartItems.isNotEmpty)
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                totalAmount += cartItems[index].price;

                                return SizedBox(
                                  child: CartListItem(
                                    model: cartItems[index],
                                  ),
                                );
                              }),
                        verticalSpace(16),
                        if (totalAmount != 0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total amount:',
                                style: TextStyles.font14GrayRegular,
                              ),
                              Text(
                                '$totalAmount\$',
                                style: TextStyles.font18BlackRegular,
                              )
                            ],
                          ),
                        verticalSpace(16),
                        if (totalAmount != 0)
                          AppTextButton(
                              buttonText: "CHECK OUT",
                              backgroundColor: AppColors.darkRed,
                              textStyle: TextStyles.font14WhiteMedium,
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushNamed(Routes.checkOutPage,
                                        arguments: database);
                              }),
                        verticalSpace(27),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }));
  }
}
