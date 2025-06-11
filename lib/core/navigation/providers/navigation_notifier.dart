import 'package:alphatwelve_ecommerce_assesment/core/navigation/providers/navigation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(NavigationState());

  void setCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void reset() {
    state = NavigationState();
  }

  int get currentIndex => state.currentIndex;

  bool get isHome => state.currentIndex == 0;
  bool get isCart => state.currentIndex == 1;
  bool get isFavorite => state.currentIndex == 2;
  bool get isProfile => state.currentIndex == 3;
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationState>(
  (ref) => NavigationNotifier(),
);
