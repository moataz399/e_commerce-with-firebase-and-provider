import 'package:e_commerce/utils/helpers/extensions.dart';
import 'package:e_commerce/utils/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/helpers/spacing.dart';
import '../../utils/routing/routes.dart';
import '../../utils/theming/text_styles.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/app_text_button.dart';
import '../widgets/app_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 46.h),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyles.font34BlackBold,
                ),
                verticalSpace(73),
                AppTextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(passwordFocusNode),
                  hintText: "Enter Your Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a valid email";
                    }
                  },
                  borderRadius: 8,
                ),
                verticalSpace(10),
                AppTextFormField(
                  controller: passwordController,
                  hintText: "Enter Your Password",
                  focusNode: passwordFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a valid password";
                    }
                  },
                  borderRadius: 8,
                ),
                verticalSpace(16),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forgot your password?',
                    style: TextStyles.font14BlackRegular,
                  ),
                ),
                verticalSpace(32),
                AppTextButton(
                  borderRadius: 8,
                  backgroundColor: AppColors.darkRed,
                  buttonText: "Login",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint("validated");
                      context.pushNamed(AppRoutes.bottomNavBar);

                    }
                  },
                ),
                verticalSpace(16),
                Center(child: DontHaveAccountText(function: () {
                  context.pushNamed(AppRoutes.signUpPage);

                })),
                verticalSpace(MediaQuery.of(context).size.height * 0.14),
                Center(
                  child: Text(
                    'Or login with social account',
                    style: TextStyles.font14BlackRegular,
                  ),
                ),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Icon(Icons.add),
                    ),
                    horizontalSpace(16),
                    Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
