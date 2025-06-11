import 'package:alphatwelve_ecommerce_assesment/core/extension/build_context_extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/extension/responsive_size_extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/navigation/widgets/animate_page_route.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/data/model/product.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = (screenWidth - 42.w) / 2;
    final imageHeight = cardWidth * 0.95;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          SmartAnimatePageRoute(
            child: ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
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
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'product-image-${product.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: Image.asset(
                  product.imgUrl,
                  fit: BoxFit.cover,
                  height: imageHeight,
                  width: double.infinity,
                ),
              ),
            ),
            5.17.sbH,
            Hero(
              tag: 'product-title-${product.id}',
              flightShuttleBuilder:
                  (context, animation, direction, fromContext, toContext) {
                return Material(
                  color: Colors.transparent,
                  child: DefaultTextStyle.merge(
                    style: context.textTheme.displaySmall,
                    child: Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
              child: Material(
                color: Colors.transparent,
                child: Text(
                  product.title,
                  style: context.textTheme.displaySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            5.17.sbH,
            // Hero widget for price animation
            Hero(
              tag: 'product-price-${product.id}',
              flightShuttleBuilder:
                  (context, animation, direction, fromContext, toContext) {
                return Material(
                  color: Colors.transparent,
                  child: DefaultTextStyle.merge(
                    style: context.textTheme.displayLarge,
                    child: Text('\$${product.price}'),
                  ),
                );
              },
              child: Material(
                color: Colors.transparent,
                child: Text(
                  '\$${product.price}',
                  style: context.textTheme.displayLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
