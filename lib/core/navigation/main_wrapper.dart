import 'package:alphatwelve_ecommerce_assesment/core/extension/extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/navigation/providers/navigation_notifier.dart';
import 'package:alphatwelve_ecommerce_assesment/core/navigation/widgets/nav_bar_item.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/app_color.dart';
import 'package:alphatwelve_ecommerce_assesment/features/cart_screen/presentation/screens/cart_screen.dart';
import 'package:alphatwelve_ecommerce_assesment/features/favorite_screen/presentation/screens/favorite_screen.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/provider/product_notifier.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/screens/home_screen.dart';
import 'package:alphatwelve_ecommerce_assesment/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainWrapper extends ConsumerWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationProvider);
    final navigationNotifier = ref.watch(navigationProvider.notifier);
    final cartItems = ref.watch(cartProvider);
    List<Widget> screens = [
      const HomeScreen(),
      const CartScreen(),
      const FavoriteScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: screens[navigation.currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10.h),
        color: Colors.white.withOpacity(0.95),
        height: 70.h,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavBarItem(
              iconPath: 'home'.svg,
              isActive: navigationNotifier.isHome,
              title: 'Home',
              onTap: () =>
                  ref.read(navigationProvider.notifier).setCurrentIndex(0),
            ),
            Stack(
              children: [

                NavBarItem(
                  iconPath: 'cart'.svg,
                  isActive: navigationNotifier.isCart,
                  title: 'Cart',
                  onTap: () =>
                      ref.read(navigationProvider.notifier).setCurrentIndex(1),
                ),
                cartItems.isEmpty ? const SizedBox.shrink() :  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.grey500,
                      ),
                      child: Center(
                        child: Text(
                          cartItems.length.toString(),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            NavBarItem(
              iconPath: 'favourite'.svg,
              isActive: navigationNotifier.isFavorite,
              title: 'Favorites',
              onTap: () =>
                  ref.read(navigationProvider.notifier).setCurrentIndex(2),
            ),
            NavBarItem(
              iconPath: 'profile'.svg,
              isActive: navigationNotifier.isProfile,
              title: 'Profile',
              onTap: () =>
                  ref.read(navigationProvider.notifier).setCurrentIndex(3),
            ),
          ],
        ),
      ),
    );
  }
}
