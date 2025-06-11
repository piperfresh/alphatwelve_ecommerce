import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 16.sp),
        child: SvgPicture.asset(
          'full_logo'.svg,
          height: 28.h,
          width: 56.w,
          fit: BoxFit.contain,
        ),
      ),
      title: Column(
        children: [
          Text(
            'DELIVERY ADDRESS',
            style: context.textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
              color: AppColor.grey700,
            ),
          ),
          8.sbH,
          Text(
            'Umuezike Road, Oyo State',
            style: context.textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color: AppColor.grey700,
            ),
          )
        ],
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 32.w),
          child: SvgPicture.asset('notification'.svg, width: 24, height: 24),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
