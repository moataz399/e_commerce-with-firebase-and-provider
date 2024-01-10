import 'package:e_commerce/utils/helpers/extensions.dart';
import 'package:e_commerce/utils/theming/colors.dart';
import 'package:e_commerce/views/widgets/already_have_an%20account_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/helpers/spacing.dart';
import '../../utils/routing/routes.dart';
import '../../utils/theming/text_styles.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/app_text_button.dart';
import '../widgets/app_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

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
                  "Sign up",
                  style: TextStyles.font34BlackBold,
                ),
                verticalSpace(73),
                AppTextFormField(
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(emailFocusNode),
                  focusNode: nameFocusNode,
                  controller: nameController,
                  hintText: "Enter Your name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a valid name";
                    }
                  },
                  borderRadius: 8,
                ),
                verticalSpace(10),
                AppTextFormField(
                  focusNode: emailFocusNode,
                  controller: emailController,
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
                  focusNode: passwordFocusNode,
                  controller: passwordController,
                  hintText: "Enter Your Password",
                  onEditingComplete: () {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a valid password";
                    }
                  },
                  borderRadius: 8,
                ),
                verticalSpace(16),
                AppTextButton(
                  borderRadius: 8,
                  backgroundColor: AppColors.darkRed,
                  buttonText: "SIGN UP",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint("validated");
                      context.pushNamed(AppRoutes.bottomNavBar);
                    }
                  },
                ),
                verticalSpace(16),
                Center(child: AlreadyHaveAccountTextRegister(function: () {
                  context.pushNamed(AppRoutes.loginPage);
                })),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                Center(
                  child: Text(
                    'Or sign up with social account',
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
