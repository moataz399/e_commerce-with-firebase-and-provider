import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/add_to_cart_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/routing/routes.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.model});

  final AddToCartModel model;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Dismissible(
        onDismissed: (DismissDirection direction) async {
          await database.deleteItem(model);
        },
        key: UniqueKey(),
        child: InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(Routes.productDetails, arguments: {
              "product": Product(
                  id: model.id,
                  title: model.title,
                  size: model.size,
                  imgUrl: model.imgUrl,
                  price: model.price),
              "database": database,
              "isCart": true
            });
          },
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 25,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
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
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        child: const Icon(Icons.more_vert),
                        onTap: () async {
                          await database.deleteItem(model);
                        },
                      ),
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
        ),
      ),
    );
  }
}
