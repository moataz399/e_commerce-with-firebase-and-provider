import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/constants/strings.dart';
import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/views/widgets/big_text.dart';
import 'package:e_commerce/views/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controllers/database_controller.dart';
import '../../utils/theming/colors.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int list = 10;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SafeArea(
      child: StreamBuilder<List<Product>>(
          stream: database.myFavProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var favItems = snapshot.data;
              if (favItems == null || favItems.isEmpty) {
                return Text('');
              }
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Favorites",
                        size: 34.sp,
                        color: Colors.black,
                      ),
                      verticalSpace(32),
                      ListView.builder(
                        itemCount: favItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Dismissible(
                          onDismissed: (DismissDirection direction) async {},
                          key: UniqueKey(),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        child: Image.network(
                                          favItems[index].imgUrl,
                                          fit: BoxFit.cover,
                                          height: 120.h,
                                          width: 100.w,
                                        ),
                                      ),
                                      horizontalSpace(8),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                favItems[index].title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              Row(
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: 'Color: ',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                  color: Colors
                                                                      .grey,
                                                                )),
                                                        TextSpan(
                                                          text: "color",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black,
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
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                  color: Colors
                                                                      .grey,
                                                                )),
                                                        TextSpan(
                                                          text: "size",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              verticalSpace(12),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${favItems[index].price}\$",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: RatingBarIndicator(
                                                      itemSize: 18.0,
                                                      rating: favItems[index]
                                                              .rate
                                                              ?.toDouble() ??
                                                          0.0,
                                                      itemBuilder:
                                                          (context, _) =>
                                                              const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 12.h, right: 6.w, left: 16.w),
                                        child: InkWell(
                                          child: const Icon(
                                            Icons.cancel_outlined,
                                            size: 24,
                                            color: Colors.grey,
                                          ),
                                          onTap: () async {
                                            //  await database.deleteItem(model);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                child: CircleAvatar(
                                  backgroundColor: AppColors.darkRed,
                                  child: Center(
                                      child: Icon(
                                    Icons.shopping_bag_rounded,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return LoadingPage();
          }),
    );
  }
}
