import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback onClick;
  final String title;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.color,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height ?? context.heightR(0.06),
        width: width ?? context.widthR(0.4),
        decoration: BoxDecoration(
          color: color ?? context.appTheme.button,
          borderRadius: BorderRadius.circular(36.r),
        ),
        child: Center(
          child: Text(
            title,
            style: context.appTextStyles.displayMedium.copyWith(
              color: context.appTheme.white,
            ),
          ),
        ),
      ),
    );
  }
}
