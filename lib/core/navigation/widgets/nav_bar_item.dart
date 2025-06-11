import 'package:alphatwelve_ecommerce_assesment/core/extension/build_context_extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/extension/responsive_size_extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    this.iconPath,
    this.title,
    this.onTap,
    this.isActive = false,
  });

  final String? iconPath;
  final String? title;
  final void Function()? onTap;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 32.h,
            width: 56.w,
            decoration: BoxDecoration(
              color: isActive ? AppColor.primary : null,
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: SvgPicture.asset(
              fit: BoxFit.scaleDown,
              width: 24.w,
              height: 24.h,
              iconPath ?? '',
              colorFilter: ColorFilter.mode(
                  isActive ? AppColor.white : AppColor.black, BlendMode.srcIn),
            ),
          ),
          4.sbH,
          Text(
            title ?? '',
            style: context.textTheme.bodyMedium?.copyWith(
                color: isActive ? AppColor.primary : AppColor.black100,
                fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
