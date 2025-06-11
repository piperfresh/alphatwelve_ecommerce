import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border(
              top: BorderSide(color: AppColor.grey200, width: 0.5.w),
              bottom: BorderSide(color: AppColor.white100, width: 0.5.w),
              left: BorderSide(color: AppColor.white100, width: 0.5.w),
              right: BorderSide(color: AppColor.white100, width: 0.5.w),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('back_arrow'.svg),
            10.sbW,
            Text(title,
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 17.sp,
                )),
          ],
        ),
      ),
    );
  }
}
