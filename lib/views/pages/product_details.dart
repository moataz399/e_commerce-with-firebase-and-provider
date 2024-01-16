import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/add_to_cart_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/constants/strings.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:e_commerce/views/widgets/app_text_button.dart';
import 'package:e_commerce/views/widgets/main_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/theming/colors.dart';
import '../widgets/drop_down_menu.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

late String dropdownValue;

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false;

  Future<void> _addToCart(Database database) async {
    try {
      await database.addToCart(AddToCartModel(
          productId: widget.product.id,
          id: documentIdFromLocalData(),
          title: widget.product.title,
          imgUrl: widget.product.imgUrl,
          size: dropdownValue,
          price: widget.product.price));
    } catch (e) {
      MainDialog(
              title: "Error",
              context: context,
              content: "failed adding to cart ")
          .showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.product.title,
          style: TextStyles.font18BlackRegular,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.product.imgUrl,
              height: size.height * 0.55,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: DropDownMenuComponent(
                            items: const ['S', 'M', 'L', 'XL', 'XXL'],
                            hint: 'Size',
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.favorite,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.title,
                              style: TextStyles.font24BlackRegular),
                          Text(widget.product.category,
                              style: TextStyles.font11greySemiBold),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                      Text("\$${widget.product.price}",
                          style: TextStyles.font24BlackRegular),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'This is a dummy description for this product! I think we will add it in the future! I need to add more lines, so I add these words just to have more than two lines!',
                      style: TextStyles.font14BlackRegular,
                    ),
                  ),
                  verticalSpace(20),
                  AppTextButton(
                    buttonText: "ADD TO CART",
                    backgroundColor: AppColors.darkRed,
                    textStyle: TextStyles.font14WhiteMedium,
                    onPressed: () => _addToCart(database),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
