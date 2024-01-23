// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// class SocialLogin extends StatefulWidget {
//   SocialLogin({super.key});
//
//   @override
//   State<SocialLogin> createState() => _SocialLoginState();
// }
//
// class _SocialLoginState extends State<SocialLogin> {
//   bool isLoading = false;
//
//   Future signInWithGoogle(BuildContext context) async {
//     // Trigger the authentication flow
//
//
//     setState((){
//       isLoading = true;
//
//     });
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     if (googleUser == null) {
//
//       setState((){
//         isLoading = false;
//
//       });
//       return;
//     }
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;
//
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     await FirebaseAuth.instance.signInWithCredential(credential);
//
//     setState((){
//       isLoading = false;
//
//     });
//     Navigator.of(context)
//         .pushNamedAndRemoveUntil(Routes.homeScreen, (route) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const Center(
//             child: CircularProgressIndicator(
//               color: Colors.orange,
//             ),
//           )
//         : Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 width: 70,
//                 height: 70,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[50],
//                   borderRadius: BorderRadius.circular(70),
//                 ),
//                 child: Image.asset(
//                   'assets/images/facebook-logo.png',
//                   fit: BoxFit.fill,
//                   height: 30.h,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   signInWithGoogle(context);
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   width: 70,
//                   height: 70,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[50],
//                     borderRadius: BorderRadius.circular(70),
//                   ),
//                   child: Image.asset(
//                     'assets/images/google-black-logo.png',
//                     fit: BoxFit.fill,
//                     height: 30.h,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 width: 70,
//                 height: 70,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[50],
//                   borderRadius: BorderRadius.circular(70),
//                 ),
//                 child: Image.asset(
//                   'assets/images/apple-logo.png',
//                   fit: BoxFit.fill,
//                   height: 30.h,
//                 ),
//               ),
//             ],
//           );
//   }
// }
