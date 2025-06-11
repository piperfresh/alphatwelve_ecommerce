import 'dart:convert';

import 'package:alphatwelve_ecommerce_assesment/features/home_screen/data/model/product.dart';
import 'package:alphatwelve_ecommerce_assesment/sample_product_json.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]) {
    _loadProducts();
  }

  void _loadProducts() {
    String cleanJson = sampleProductJson

        /// Remove control characters
        .replaceAll(RegExp(r'[\x00-\x1F\x7F]'), ' ')

        /// Replace multiple spaces with single space
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    final List<dynamic> jsonList = jsonDecode(cleanJson);
    state = jsonList.map((json) => Product.fromJson(json)).toList();
  }

  void toggleFavorite(String productId) {
    state = state.map(
      (product) {
        if (product.id == productId) {
          return product.copyWith(isFavorite: !product.isFavorite);
        }
        return product;
      },
    ).toList();
  }

  void addToCart(String productId) {
    state = state.map(
      (product) {
        if (product.id == productId) {
          return product.copyWith(cartQuantity: product.cartQuantity + 1);
        }
        return product;
      },
    ).toList();
  }

  void removeFromCart(String productId) {
    state = state.map(
      (product) {
        if (product.id == productId && product.cartQuantity > 0) {
          return product.copyWith(cartQuantity: product.cartQuantity - 1);
        }
        return product;
      },
    ).toList();
  }

  void removeProductFromCart(String productId) {
    state = state.map((product) {
      if (product.id == productId) {
        return product.copyWith(cartQuantity: 0);
      }
      return product;
    }).toList();
  }
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>(
  (ref) => ProductNotifier(),
);

final favoritesProvider = Provider<List<Product>>((ref) {
  final products = ref.watch(productNotifierProvider);
  return products.where((product) => product.isFavorite).toList();
});

final cartProvider = Provider<List<Product>>(
  (ref) {
    final products = ref.watch(productNotifierProvider);
    return products.where((product) => product.cartQuantity > 0).toList();
  },
);

final cartTotalProvider = Provider<double>(
  (ref) {
    final cartItems = ref.watch(cartProvider);
    return cartItems.fold(
      0,
      (total, product) {
        return total + (product.price * product.cartQuantity);
      },
    );
  },
);

final cartSubtotalProvider = Provider<double>((ref) {
  return ref.watch(cartTotalProvider);
});

final shippingCostProvider = Provider<double>((ref) {
  final cartItems = ref.watch(cartProvider);
  return cartItems.isEmpty ? 0 : 10;
});

final cartGrandTotalProvider = Provider<double>((ref) {
  final subtotal = ref.watch(cartSubtotalProvider);
  final shipping = ref.watch(shippingCostProvider);
  return subtotal + shipping;
});
