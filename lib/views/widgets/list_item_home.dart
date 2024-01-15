import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/utils/routing/routes.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/product_model.dart';

class ListItemHome extends StatelessWidget {
  final Product product;

  const ListItemHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(AppRoutes.productDetails, arguments: product);
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.imgUrl,
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50.w,
                  height: 30.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: product.discountValue == 0
                            ? Colors.black
                            : Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text(
                      product.discountValue == 0
                          ? "New"
                          : "${product.discountValue}%",
                      style: product.discountValue == 0
                          ? TextStyles.font12WhiteSemiBold
                          : TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                    )),
                  ),
                ),
              )
            ],
          ),
          verticalSpace(8),
          Text(
            product.category,
            style: TextStyles.font11greySemiBold,
          ),
          Text(
            product.title,
            style: TextStyles.font16BlackRegular,
          ),
          horizontalSpace(6),
          Text(
            "${product.price}\$",
            style: TextStyles.font14RedMedium,
          )
        ]),
      ),
    );
  }
}
