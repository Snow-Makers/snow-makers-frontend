import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: context.appTheme.white,
                size: 24.w,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: context.appTheme.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: context.appTheme.white,
                size: 24.w,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: context.appTheme.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
