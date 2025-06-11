import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/themes.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/data/model/product.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/provider/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CartCard extends ConsumerWidget {
  const CartCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColor.greyLight,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              'iphone'.png,
              fit: BoxFit.cover,
              width: 102.87.w,
              height: 106.51.h,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apple iPhone 16 128GB|Teal',
                style: context.textTheme.bodySmall,
              ),
              5.sbH,
              Text(
                '\$${product.price}',
                style: context.textTheme.bodyMedium,
              ),
              5.sbH,
              Text(
                'In stock',
                style: context.textTheme.bodySmall
                    ?.copyWith(color: AppColor.green500),
              ),
              8.sbH,
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              ref
                                  .read(productNotifierProvider.notifier)
                                  .removeFromCart(product.id);
                            },
                            child: SvgPicture.asset('minus'.svg)),
                        16.sbW,
                        Text(
                          '${product.cartQuantity}',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColor.grey700,
                          ),
                        ),
                        16.sbW,
                        GestureDetector(
                            onTap: () {
                              ref
                                  .read(productNotifierProvider.notifier)
                                  .addToCart(product.id);
                            },
                            child: SvgPicture.asset('plus'.svg)),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          ref
                              .read(productNotifierProvider.notifier)
                              .removeProductFromCart(product.id);
                        },
                        child: SvgPicture.asset('delete'.svg)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
