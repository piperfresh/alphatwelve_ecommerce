import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: context.textTheme.displaySmall?.copyWith(
              color: AppColor.grey300,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 11.96.w, right: 5.w),
              child: SvgPicture.asset(
                'search'.svg,
                width: 12.08.w,
                height: 12.08.h,
                fit: BoxFit.contain,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 12.08,
              minHeight: 12.08,
            ),
            contentPadding: EdgeInsets.zero,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.w),
                borderSide: const BorderSide(
                  color: AppColor.grey200,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.w),
                borderSide: const BorderSide(
                  color: AppColor.grey200,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.w),
                borderSide: const BorderSide(
                  color: AppColor.grey200,
                ))),
      ),
    );
  }
}
