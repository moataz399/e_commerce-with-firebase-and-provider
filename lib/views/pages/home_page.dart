import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/theming/font_weight_helper.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:e_commerce/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                "https://www.thoughtco.com/thmb/DxSLkmDcJK6rvht3DLI8LLcKv4s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
                height: 225.h,
              ),
              Opacity(
                opacity: .2,
                child: Container(
                  width: double.infinity,
                  height: 225.h,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 15.h),
                child: Text("Street Clothes ",
                    style: TextStyles.font34WhiteExtraBold),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 18.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sale",
                            style: TextStyles.font34BlackBold.copyWith(
                                fontWeight: FontWeightHelper.extraBold)),
                        Text("Super summer sale",
                            style: TextStyles.font11greyRegular.copyWith(
                              color: Color(0xFF9B9B9B),
                            )),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        //  context.pushNamed(AppRoutes.pageName);
                      },
                      child: Text("View all ",
                          style: TextStyles.font11greyRegular.copyWith(
                            color: Color(0xFF222222),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 300.h,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: e),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.0.w,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("New",
                            style: TextStyles.font34BlackBold.copyWith(
                                fontWeight: FontWeightHelper.extraBold)),
                        Text("You’ve never seen it before!",
                            style: TextStyles.font11greyRegular.copyWith(
                              color: Color(0xFF9B9B9B),
                            )),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        //  context.pushNamed(AppRoutes.pageName);
                      },
                      child: Text("View all ",
                          style: TextStyles.font11greyRegular.copyWith(
                            color: Color(0xFF222222),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 300.h,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: e),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
