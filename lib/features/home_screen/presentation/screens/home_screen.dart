import 'package:alphatwelve_ecommerce_assesment/core/extension/build_context_extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/extension/responsive_size_extension.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/app_fonts.dart';
import 'package:alphatwelve_ecommerce_assesment/core/widgets/custom_app_bar.dart';
import 'package:alphatwelve_ecommerce_assesment/core/widgets/custom_text_field.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/provider/product_notifier.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/widgets/custom_title.dart';
import 'package:alphatwelve_ecommerce_assesment/features/home_screen/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productNotifierProvider);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomTextField(
                controller: _searchController,
                onChanged: (p0) {
                  _onSearchChanged();
                },
              ),
            ),
            16.sbH,
            CustomTitle(
              title: 'Technology',
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.sbH,
                  Text(
                    'Smartphones, Laptops & Accessories',
                    style: context.textTheme.displayMedium?.copyWith(
                      fontFamily: AppFonts.ibmMono,
                      fontSize: 18.sp,
                    ),
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    final filterProducts = products
                        .where((product) => product.title
                            .toLowerCase()
                            .contains(_searchController.text.toLowerCase()))
                        .toList();
                    return filterProducts.isEmpty
                        ? SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.5,
                            child: const Center(
                              child: Text('No products found'),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filterProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 0.80.h,
                        mainAxisSpacing: 15.0.h,
                      ),
                      itemBuilder: (context, index) {
                              final product = filterProducts[index];
                              return ProductCard(product: product);
                            },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
