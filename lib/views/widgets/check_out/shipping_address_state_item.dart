import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/shipping_address.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/arguments/add_shipping_address_args.dart';
import '../../../utils/routing/routes.dart';
import '../../../utils/theming/text_styles.dart';

class ShippingAddressStateItem extends StatefulWidget {
  const ShippingAddressStateItem(
      {super.key, required this.shippingAdress, required this.database});

  final ShippingAddressModel shippingAdress;
  final Database database;

  @override
  State<ShippingAddressStateItem> createState() =>
      _ShippingAddressStateItemState();
}

class _ShippingAddressStateItemState extends State<ShippingAddressStateItem> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
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
                  widget.shippingAdress.fullName,
                  style: TextStyles.font14BlackRegular,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        Routes.addShippingAddressPage,
                        arguments: AddShippingAddressArgs(
                            database: database,
                            shippingAddress: widget.shippingAdress));
                  },
                  child: Text(
                    'Edit',
                    style: TextStyles.font14DarkRedMedium,
                  ),
                )
              ],
            ),
            verticalSpace(6),
            Text(
              widget.shippingAdress.address,
              style: TextStyles.font14BlackRegular,
            ),
            Text(
              '${widget.shippingAdress.city},${widget.shippingAdress.state},${widget.shippingAdress.country}',
              style: TextStyles.font14BlackRegular,
            ),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }
}
