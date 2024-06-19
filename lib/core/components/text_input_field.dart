import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class TextInputField extends ConsumerWidget {
  final TextEditingController? controller;
  final String hint;
  final void Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? label;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final bool enable;
  final bool isPassword;
  final bool readOnly;

  final TextInputAction action;
  final int maxLines;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextInputField({
    super.key,
    this.hint = '',
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.initialValue,
    this.inputFormatters,
    this.validator,
    this.action = TextInputAction.done,
    this.enable = true,
    this.isPassword = false,
    this.maxLines = 1,
    this.prefixIcon,
    this.fillColor,
    this.suffixIcon,
    this.readOnly = false,
    this.controller,
    this.label,
    this.inputType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isPasswordVisible = ref.watch(_isPasswordVisible);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: context.appTextStyles.bodyLarge,
          ),
        if (label != null) 8.verticalSpace,
        TextFormField(
          controller: controller,
          style: context.appTextStyles.subheadLarge,
          readOnly: readOnly,
          onChanged: onChanged,
          onTap: onTap,
          initialValue: initialValue,
          onEditingComplete: onEditingComplete,
          inputFormatters: inputFormatters,
          enabled: enable,
          keyboardType: inputType,
          validator: validator,
          textInputAction: action,
          maxLines: maxLines,
          decoration: InputDecoration(
            counterText: '',
            fillColor: fillColor,
            prefixIcon: prefixIcon,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20.w,
                    ),
                    onPressed: () {
                      ref.read(_isPasswordVisible.notifier).state =
                          !isPasswordVisible;
                    },
                  )
                : suffixIcon,
            hintText: hint,
          ),
          obscureText: isPassword && !ref.watch(_isPasswordVisible),
        ),
      ],
    );
  }
}

final _isPasswordVisible = StateProvider((ref) => false);
