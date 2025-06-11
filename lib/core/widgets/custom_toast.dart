import 'dart:async';

import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomToast {
  static void showSuccess(BuildContext context, String message) {
    ///  Overlay to show toast at top
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 23.h,
        left: 20.w,
        right: 20.w,
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 56.h,
            width: 335.w,
            decoration: BoxDecoration(
              color: AppColor.green500,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 5.w),
              height: 56.h,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'check_circle'.svg,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      message,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor.grey700,
                            fontSize: 15.sp,
                          ),
                    ),
                  ),
                  SvgPicture.asset(
                    'close'.svg,
                    width: 24.w,
                    height: 24.h,
                  ),
                  8.sbW,
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    /// Remove the toast after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
