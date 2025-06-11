import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:flutter/material.dart';

class OrderInfoRowText extends StatelessWidget {
  const OrderInfoRowText({
    super.key,
    required this.leftText,
    required this.rightText,
    this.style,
  });

  final String leftText;
  final String rightText;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: context.textTheme.displayMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          rightText,
          style: style ??
              context.textTheme.displayMedium?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
