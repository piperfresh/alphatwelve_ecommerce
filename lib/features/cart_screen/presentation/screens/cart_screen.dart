import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/widgets/custom_app_bar.dart';
import 'package:alphatwelve_ecommerce_assesment/core/widgets/custom_button.dart';
import 'package:alphatwelve_ecommerce_assesment/features/cart_screen/presentation/widgets/cart_card.dart';
import 'package:alphatwelve_ecommerce_assesment/features/cart_screen/presentation/widgets/order_info_row_text.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/provider/product_notifier.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/screens/home_screen.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(
                title: 'Your Cart',
                onTap: () {
                  context.pop();
                },
              ),
              10.sbH,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: cartProducts.isEmpty
                    ? Center(
                        child: Text(
                          'Your cart is empty',
                          style: context.textTheme.displayLarge,
                        ),
                      )
                    : ListView.separated(
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          final cartProduct = cartProducts[index];
                          return CartCard(product: cartProduct);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 15.sbH;
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order info',
                      style: context.textTheme.displayLarge
                          ?.copyWith(fontSize: 14.sp),
                    ),
                    15.sbH,
                    OrderInfoRowText(
                      leftText: 'Subtotal',
                      rightText: '\$${ref.watch(cartSubtotalProvider).toInt()}',
                    ),
                    15.sbH,
                    OrderInfoRowText(
                      leftText: 'Shipping',
                      rightText: '\$${ref.watch(shippingCostProvider).toInt()}',
                    ),
                    15.sbH,
                    OrderInfoRowText(
                      leftText: 'Total',
                      rightText:
                          '\$${ref.watch(cartGrandTotalProvider).toInt()}',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                  isActive: cartProducts.isNotEmpty,
                  buttonText: 'Checkout',
                  onPressed: () {}),
            ],
          ),
        ));
  }
}
