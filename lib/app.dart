import 'package:alphatwelve_ecommerce_assesment/core/navigation/main_wrapper.dart';
import 'package:alphatwelve_ecommerce_assesment/core/size_config.dart';
import 'package:alphatwelve_ecommerce_assesment/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context, 375, 812);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const MainWrapper(),
    );
  }
}
