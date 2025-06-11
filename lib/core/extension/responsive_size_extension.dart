import 'package:alphatwelve_ecommerce_assesment/core/size_config.dart';
import 'package:flutter/material.dart';

extension ResponsiveSizeExtension on num {
  double get h => SizeConfig.getProportionateScreenHeight(toDouble());

  double get w => SizeConfig.getProportionateScreenWidth(toDouble());

  double get sp => SizeConfig.getAdaptiveFontSize(toDouble());

  double get r => SizeConfig.getProportionateScreenWidth(toDouble());

  SizedBox get sbW => SizedBox(width: w);

  SizedBox get sbH => SizedBox(height: h);
}
