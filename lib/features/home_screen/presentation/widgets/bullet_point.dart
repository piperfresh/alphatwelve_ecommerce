import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/themes.dart';
import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? bulletColor;
  final double? bulletSize;
  final double spacing;

  const BulletPoint({
    super.key,
    required this.text,
    this.textStyle,
    this.bulletColor,
    this.bulletSize,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6.h, right: spacing.w),
          width: bulletSize ?? 4.w,
          height: bulletSize ?? 4.h,
          decoration: BoxDecoration(
            color: bulletColor ?? AppColor.grey400,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: textStyle ??
                context.textTheme.displaySmall
                    ?.copyWith(color: AppColor.grey400),
          ),
        ),
      ],
    );
  }
}
