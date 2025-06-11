import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/app_color.dart';
import 'package:alphatwelve_ecommerce_assesment/core/widgets/custom_toast.dart';
import 'package:alphatwelve_ecommerce_assesment/core/widgets/custom_widgets.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/data/model/product.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/provider/product_notifier.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/widgets/bullet_point.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  ConsumerState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = screenWidth;
    final imageHeight = cardWidth * 0.92;
    final currentProduct = ref.watch(productNotifierProvider).firstWhere(
          (product) => product.id == widget.product.id,
    );

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTitle(
              title: 'Go back',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            10.sbH,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: cardWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Hero(
                              tag: 'product-image-${widget.product.id}',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  widget.product.imgUrl,
                                  fit: BoxFit.cover,
                                  height: imageHeight,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 20,
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                      .read(productNotifierProvider.notifier)
                                      .toggleFavorite(widget.product.id);
                                  CustomToast.showSuccess(
                                    context,
                                    currentProduct.isFavorite
                                        ? 'Item removed from favorites'
                                        : 'Item added to favorites',
                                  );
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.white,
                                  ),
                                  height: 44.h,
                                  width: 44.w,
                                  child: SvgPicture.asset(
                                    currentProduct.isFavorite
                                        ? 'active_favorite'.svg
                                        : 'favorite'.svg,
                                    width: 20.w,
                                    height: 18.h,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        10.58.sbH,
                        Hero(
                          tag: 'product-title-${widget.product.id}',
                          flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
                            return Material(
                              color: Colors.transparent,
                              child: DefaultTextStyle.merge(
                                style: context.textTheme.displaySmall?.copyWith(
                                  fontSize: 17.sp,
                                ),
                                child: Text(widget.product.title),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              widget.product.title,
                              style: context.textTheme.displaySmall?.copyWith(
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                        10.58.sbH,
                        Hero(
                          tag: 'product-price-${widget.product.id}',
                          flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
                            return Material(
                              color: Colors.transparent,
                              child: DefaultTextStyle.merge(
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 32.75.sp,
                                ),
                                child: Text('\$${widget.product.price}'),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              '\$${widget.product.price}',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 32.75.sp,
                              ),
                            ),
                          ),
                        ),
                        15.sbH,
                        AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(milliseconds: 150),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About this item',
                                style: context.textTheme.displaySmall
                                    ?.copyWith(color: AppColor.grey400),
                              ),
                              ...widget.product.description
                                  .split('tord.')
                                  .map((point) => Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: BulletPoint(
                                  text: point,
                                  bulletColor: AppColor.primary,
                                  bulletSize: 5.w,
                                  spacing: 12.0,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 200),
              child: CustomButton(
                isActive: true,
                buttonText: 'Add to Cart',
                onPressed: () {
                  ref
                      .read(productNotifierProvider.notifier)
                      .addToCart(widget.product.id);

                  CustomToast.showSuccess(context, 'Item has been added to cart');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


