import 'package:e_commerce/utils/helpers/spacing.dart';
import 'package:e_commerce/utils/theming/text_styles.dart';
import 'package:e_commerce/views/widgets/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "My profile",
                size: 34.sp,
                color: Colors.black,
              ),
              verticalSpace(22),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        )),
                  ),
                  horizontalSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Moataz Mohamed",
                        style: TextStyles.font18BlackSemiMedium,
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser!.email!,
                        style: TextStyles.font14LightGreyRegular,
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(26     ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My orders",
                                style: TextStyles.font16BlackRegular,
                              ),
                              Text(
                                'Already have 12 orders',
                                style: TextStyles.font11greyRegular,
                              )
                            ],
                          ),
                          IconButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.grey,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.grey[100], height: 1.0);
                  },
                  itemCount: 6)
            ],
          ),
        ),
      ),
    );
  }
}
//
