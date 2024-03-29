
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigText extends StatelessWidget {
  final String text;
   Color? color;
  TextOverflow? textOverflow;
  double? size;

  BigText(
      {super.key,
        required this.text,
        this.color = const Color(0xFF332d2b),
        this.textOverflow = TextOverflow.ellipsis,
        this.size = 0});

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: size!.sp,
          overflow: textOverflow,
          fontWeight: FontWeight.w700),
    );
  }
}