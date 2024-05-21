import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelvic_technologies/productHelpers/productPage.dart';
import 'package:kelvic_technologies/screens/aboutScreen.dart';
import 'package:kelvic_technologies/screens/blogScreen.dart';
import 'package:kelvic_technologies/screens/homeScreen.dart';
import 'package:kelvic_technologies/screens/productsScreen.dart';
import 'package:kelvic_technologies/screens/serviceScreen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/About', page: () => AboutScreen()),
        GetPage(name: '/Product', page: () => ProductsScreen()),
        GetPage(name: '/Services', page: () => ServicesScreen()),
        GetPage(name: '/Blog', page: () => BlogScreen())
      ],
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 610, end: 800, name: TABLET),
          const Breakpoint(start: 800, end: 800, name: 'ADJUST_APPBAR'),
          const Breakpoint(start: 1000, end: 1000, name: 'ADJUST_PRODUCT'),
          const Breakpoint(start: 1120, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: '/',
      home: HomeScreen(),
      //home: BlogScreen(),
    );
  }
}
