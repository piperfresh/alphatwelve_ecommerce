import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.isActive = false,
  });

  final String buttonText;
  final void Function()? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 40.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: isActive ? AppColor.primary : Colors.grey.shade400,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        onPressed: isActive ? onPressed : null,
        child: Text(
          buttonText,
          style: context.textTheme.displayMedium?.copyWith(
            fontSize: 14.sp,
            color: AppColor.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
