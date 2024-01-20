import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/utils/routing/routes.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../utils/theming/colors.dart';

class ListItemHome extends StatelessWidget {
  final Product product;

  const ListItemHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
            Routes.productDetails,
            arguments: {"product": product, "database": database});
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
                            : AppColors.darkRed,
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
              ),
              Positioned(
                left: size.width * 0.43,
                bottom: size.height * 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: InkWell(
                      onTap: () {
                        debugPrint('tapped');
                        debugPrint(product.rate.toString());
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 20.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(8),
          Row(
            children: [
              RatingBarIndicator(
                itemSize: 25.0,
                rating: product.rate?.toDouble() ?? 0.0,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                direction: Axis.horizontal,
              ),
              const SizedBox(width: 4.0),
              Text(
                '(100)',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
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
            style: TextStyles.font14DarkRedMedium,
          )
        ]),
      ),
    );
  }
}
