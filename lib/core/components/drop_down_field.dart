import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snowmakers/core/utilities/extensions.dart';

class DropDownField<T> extends ConsumerWidget {
  final List<T>? items;
  final void Function(T?) onChanged;
  final List<DropdownMenuItem<T>>? customItems;
  final String label;
  final String hint;
  final String? Function(T?)? validator;

  const DropDownField({
    this.items,
    required this.onChanged,
    required this.label,
    required this.hint,
    this.customItems,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.appTextStyles.bodyMedium),
        5.verticalSpace,
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<T>(
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down_rounded),
            ),
            isExpanded: true,
            items: customItems ??
                items?.map((T value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: Text(value.toString().tr()),
                  );
                }).toList(),
            decoration: InputDecoration(
              fillColor: context.theme.inputDecorationTheme.fillColor,
              isDense: true,
              hintText: hint,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: context.theme.inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            validator: validator,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
