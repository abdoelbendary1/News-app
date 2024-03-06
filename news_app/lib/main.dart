import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/providers/bookmarkProvider.dart';
import 'package:news_app/screens/category/category_details.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:news_app/tabs/homeTab/newsItemScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: ((context) => ChangeNotifierProvider(
          create: (context) => BookmarkProvider(), child: MyApp())),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        /*  CategoryDetails.routeName: (context) => CategoryDetails(), */
        NewsItemScreen.routeName: (context) => NewsItemScreen(),
      },
    );
  }
}
