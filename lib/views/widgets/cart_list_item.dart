import 'package:e_commerce/models/add_to_cart_model.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.model});

  final AddToCartModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h),
      child: Card(
        color: Colors.white,
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
              child: Image.network(
                model.imgUrl,
                fit: BoxFit.cover,
                height: 100.h,
                width: 100.w,
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Color: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.grey,
                                      )),
                              TextSpan(
                                text: model.color,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Size: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.grey,
                                      )),
                              TextSpan(
                                text: model.size,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.more_vert),
                  verticalSpace(4),
                  Text(
                    '${model.price}\$',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
