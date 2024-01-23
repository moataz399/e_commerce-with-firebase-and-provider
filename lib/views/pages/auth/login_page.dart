import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/utils/helpers/extensions.dart';
import 'package:e_commerce/utils/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controllers/auth_controller.dart';
import '../../../utils/helpers/spacing.dart';
import '../../../utils/routing/routes.dart';
import '../../../utils/theming/text_styles.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/auth/dont_have_an_account.dart';

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

  Future<void> _submit(AuthController controller) async {
    try {
      if (_formKey.currentState!.validate()) {
        await controller.submitLogin(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        if (!mounted) return;
        Navigator.of(context).pushNamed(Routes.bottomNavBar);
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text(
                  e.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                title: const Text(
                  "Error!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.red),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('ok'),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
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
                Consumer<AuthController>(
                  builder: (_, controller, __) {
                    return AppTextButton(
                      borderRadius: 8,
                      backgroundColor: AppColors.darkRed,
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        _submit(controller);
                      },
                    );
                  },
                ),
                verticalSpace(16),
                Center(child: DontHaveAccountText(function: () {
                  context.pushNamed(Routes.signUpPage);
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
